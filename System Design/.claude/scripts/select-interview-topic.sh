#!/bin/bash

# select-interview-topic.sh
# Intelligent topic selection using priority algorithm:
# 1. Mandatory Remediation (weak topics due for re-interview)
# 2. Weak Topic Reinforcement (ok-confidence topics not interviewed in 5+ sessions)
# 3. Uncovered Topics (next unseen topic at current level)
# 4. Variety (alternate between types)

set -e

CLAUDE_MD="/Users/yashvi/prep/System Design/CLAUDE.md"

# Verify CLAUDE.md exists
if [[ ! -f "$CLAUDE_MD" ]]; then
    echo "ERROR: CLAUDE.md not found at $CLAUDE_MD"
    exit 1
fi

# Extract current level from CLAUDE.md
extract_current_level() {
    grep "Current Level:" "$CLAUDE_MD" | head -1 | grep -oE '[0-9]+'
}

# Find all uncovered topics by grepping for [ ]
find_uncovered_patterns() {
    # Lines containing "| Singleton | [ ]" pattern - extract topic name
    grep -E '^\| [A-Za-z].*\| \[ \]' "$CLAUDE_MD" | \
        head -22 | \
        awk -F'|' '{print $2}' | \
        sed 's/^[[:space:]]*//;s/[[:space:]]*$//'
}

# Find weak confidence topics (containing | weak |)
find_weak_patterns() {
    grep -E '^\| [A-Za-z].*\| weak' "$CLAUDE_MD" | \
        awk -F'|' '{print $2}' | \
        sed 's/^[[:space:]]*//;s/[[:space:]]*$//'
}

# Find weak topics in OOP section
find_weak_oop() {
    grep -E '^\| [A-Za-z].*\| weak' "$CLAUDE_MD" | \
        awk -F'|' '{print $2}' | \
        sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | \
        tail -10
}

# Find uncovered topics in OOP section
find_uncovered_oop() {
    grep -E '^\| [A-Za-z].*\| \[ \]' "$CLAUDE_MD" | \
        tail -10 | \
        awk -F'|' '{print $2}' | \
        sed 's/^[[:space:]]*//;s/[[:space:]]*$//'
}

# Find uncovered principles
find_uncovered_principles() {
    grep -E '^\| [A-Za-z].*\| \[ \]' "$CLAUDE_MD" | \
        tail -5 | \
        awk -F'|' '{print $2}' | \
        sed 's/^[[:space:]]*//;s/[[:space:]]*$//'
}

# Find uncovered design problems
find_uncovered_problems() {
    grep -E '^\| [A-Za-z].*\| \[ \]' "$CLAUDE_MD" | \
        tail -33 | \
        awk -F'|' '{print $2}' | \
        sed 's/^[[:space:]]*//;s/[[:space:]]*$//'
}

# Main selection logic
main() {
    local current_level=$(extract_current_level)

    # Validate level extraction
    if [[ -z "$current_level" ]]; then
        echo "error"
        echo "Could not extract current level from CLAUDE.md"
        exit 1
    fi

    # Priority 1: Mandatory Remediation (weak confidence topics)
    # Check all tables for weak entries
    local weak_topics=$(grep -E '^\| [A-Za-z].*\| weak' "$CLAUDE_MD" | head -1 | awk -F'|' '{print $2}' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

    if [[ -n "$weak_topics" ]]; then
        echo "remediation"
        echo "$weak_topics"
        return 0
    fi

    # Priority 2: Weak reinforcement (ok confidence topics)
    # This would require tracking last interview date, for MVP we skip this

    # Priority 3: Uncovered topics at current level
    # Level 1: Patterns, OOP Concepts, Principles
    if [[ "$current_level" -eq 1 ]]; then
        # Try patterns first (first 22 pattern rows)
        local uncovered=$(grep -E '^\| [A-Za-z].*\| \[ \]' "$CLAUDE_MD" | head -1 | awk -F'|' '{print $2}' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

        if [[ -n "$uncovered" ]]; then
            echo "uncovered"
            echo "$uncovered"
            return 0
        fi
    fi

    # Level 3+: Design Problems
    if [[ "$current_level" -ge 3 ]]; then
        local uncovered=$(grep -E '^\| [A-Za-z].*\| \[ \]' "$CLAUDE_MD" | grep -E '^(\| (ATM|Parking|Elevator|Hotel|Library|Movie|Airline|Concert|Course|Cricinfo|Digital|Food|Chess|Coffee|Car|Logging|LRU|Online|Ride|Snake|Music|Stack|Task|Tic|Traffic|Vending|Restaurant|Social|Pub|Splitwise))' | head -1 | awk -F'|' '{print $2}' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

        if [[ -n "$uncovered" ]]; then
            echo "uncovered"
            echo "$uncovered"
            return 0
        fi
    fi

    # Fallback: If no selection, return first uncovered topic
    local fallback=$(grep -E '^\| [A-Za-z].*\| \[ \]' "$CLAUDE_MD" | head -1 | awk -F'|' '{print $2}' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

    if [[ -n "$fallback" ]]; then
        echo "uncovered"
        echo "$fallback"
        return 0
    fi

    # Final fallback: return Singleton pattern as MVP default
    echo "review"
    echo "Singleton"
    return 0
}

main "$@"
