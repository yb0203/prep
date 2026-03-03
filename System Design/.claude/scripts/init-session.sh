#!/bin/bash

# init-session.sh
# Initialize a new session with topic selection and report creation.
#
# Usage: ./init-session.sh
#
# Steps:
# 1. Count existing practice/session-* directories to determine N
# 2. Call select-interview-topic.sh to pick next topic
# 3. Create practice/session-N/ directory
# 4. Copy session-0/report.md template to session-N/report.md
# 5. Fill in session metadata (date, topic, level, selection type)
# 6. Output paths and metadata to stdout
# 7. Make executable and commit

set -e

SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPTS_DIR/../.." && pwd)"
PRACTICE_DIR="$PROJECT_ROOT/practice"
CLAUDE_MD="$PROJECT_ROOT/CLAUDE.md"
SESSION_0_TEMPLATE="$PRACTICE_DIR/session-0/report.md"
SELECT_TOPIC_SCRIPT="$SCRIPTS_DIR/select-interview-topic.sh"

# Verify required files and directories exist
if [[ ! -f "$CLAUDE_MD" ]]; then
    echo "ERROR: CLAUDE.md not found at $CLAUDE_MD"
    exit 1
fi

if [[ ! -f "$SESSION_0_TEMPLATE" ]]; then
    echo "ERROR: Session 0 template not found at $SESSION_0_TEMPLATE"
    exit 1
fi

if [[ ! -f "$SELECT_TOPIC_SCRIPT" ]]; then
    echo "ERROR: select-interview-topic.sh not found at $SELECT_TOPIC_SCRIPT"
    exit 1
fi

if [[ ! -d "$PRACTICE_DIR" ]]; then
    echo "ERROR: practice directory not found at $PRACTICE_DIR"
    exit 1
fi

# Step 1: Count existing practice/session-* directories to determine N
count_sessions() {
    local count=0
    for dir in "$PRACTICE_DIR"/session-*; do
        if [[ -d "$dir" ]]; then
            count=$((count + 1))
        fi
    done
    echo "$count"
}

# Step 2: Extract current level from CLAUDE.md
extract_current_level() {
    grep "Current Level:" "$CLAUDE_MD" | head -1 | grep -oE '[0-9]+' | head -1
}

# Step 3: Call select-interview-topic.sh to get topic and selection type
select_topic() {
    # The select-interview-topic.sh outputs:
    # Line 1: selection_type (remediation/uncovered/review/etc)
    # Line 2: topic_name
    local output=$("$SELECT_TOPIC_SCRIPT" 2>/dev/null || echo -e "review\nSingleton")
    echo "$output"
}

# Get current date in YYYY-MM-DD format
get_current_date() {
    date +"%Y-%m-%d"
}

# Main execution
main() {
    # Count sessions and determine next session number
    local session_count=$(count_sessions)
    local session_number=$((session_count))

    # Get metadata
    local current_date=$(get_current_date)
    local current_level=$(extract_current_level)

    # Default level to 1 if extraction fails
    if [[ -z "$current_level" ]]; then
        current_level=1
    fi

    # Get topic selection (returns 2 lines: type and topic)
    local topic_output=$(select_topic)
    local selection_type=$(echo "$topic_output" | head -1)
    local selected_topic=$(echo "$topic_output" | tail -1)

    # Create session directory
    local session_dir="$PRACTICE_DIR/session-$session_number"

    if [[ -d "$session_dir" ]]; then
        echo "ERROR: Session $session_number directory already exists at $session_dir"
        exit 1
    fi

    mkdir -p "$session_dir"

    # Step 4: Copy template to new session report
    local session_report="$session_dir/report.md"
    cp "$SESSION_0_TEMPLATE" "$session_report"

    # Step 5 & 6: Fill in metadata using sed
    # Replace placeholders in the template
    sed -i '' \
        -e "s/Session 0 — Template/Session $session_number — $current_date/" \
        -e "s/YYYY-MM-DD/$current_date/" \
        -e "s/\[Pattern\/Concept\/Problem Name\]/$selected_topic/" \
        -e "s/\[1-4\]/$current_level/" \
        "$session_report"

    # Step 7: Output summary to stdout
    echo ""
    echo "Session $session_number initialized"
    echo "Topic: $selected_topic"
    echo "Selection Type: $selection_type"
    echo "Report: practice/session-$session_number/report.md"
    echo "Level: $current_level"
    echo "Date: $current_date"
    echo ""
    echo "Full path: $session_report"
    echo ""
}

main "$@"
