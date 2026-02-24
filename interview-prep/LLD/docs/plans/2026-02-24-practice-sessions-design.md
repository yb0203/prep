# Design: Practice Sessions & Enhanced /start Command
**Date:** 2026-02-24

---

## Context

The LLD knowledge base currently has a linear `/start` command that teaches one topic per run (Theory → Practical → Quiz → write files). It has no session history, no spaced repetition, and no interview simulation mode.

Goal: make the system **interview-practice-first** — each `/start` run is a named session that adapts based on coverage progress and automatically surfaces weak topics.

---

## Core Design Decisions

### Information split
- **Topic files** (Theory.md, Practical.md, Summary.md) = permanent, evergreen knowledge. Written once, updated only when understanding deepens.
- **Session files** (practice/session-N/report.md) = temporal performance record. What was done, how it went, what to revisit next.
- These two layers never overlap.

### Practice mode evolves over time
- **Early sessions**: mostly new topic coverage (learning mode)
- **Later sessions**: mostly weak-topic drilling (interview simulation mode)
- The `/start` command reads CLAUDE.md and adapts session character automatically based on the ratio of covered/weak/new topics.

### No code files
Practice stays at logical flow / design discussion level. No code written to disk. Interview simulation focuses on explaining, designing, and reasoning — not syntax.

---

## Directory Structure

```
LLD/
├── CLAUDE.md                    ← tracker (gains Confidence column)
├── practice/
│   ├── session-1/
│   │   └── report.md
│   ├── session-2/
│   │   └── report.md
│   └── ...
├── principles/
├── patterns/
└── concepts/
```

---

## CLAUDE.md Changes

Add a **Confidence** column to all pattern and concept tables.

Scale: `—` (not yet covered) → `weak` → `ok` → `strong`

Spaced repetition rules:
- `weak` → auto-queued in next session's warmup
- `ok` → revisited every 3 sessions
- `strong` → stable, not scheduled

Principles (Theory.md only) use a simpler pass/fail: `[ ]` → `[x]`.

---

## Session Report Format

File: `practice/session-N/report.md`

```markdown
# Session N — YYYY-MM-DD

## Session type
Coverage: X/39 topics done | Mode: [Learning / Mixed / Drill]

## Topics covered this session
| Topic | Type | Activity | Outcome |
|-------|------|----------|---------|
| Classes & Objects | Principle | First-time learn | ok |
| Singleton | Pattern | Warmup drill | weak → needs revisit |

## Weak areas — carry forward to Session N+1
- Singleton: confused on thread-safety variants

## Session notes
(free text — anything worth remembering)
```

---

## Updated /start Command Flow

```
/start
  │
  ├─ 1. ORIENT
  │     Read CLAUDE.md
  │     Count: covered / weak / new topics
  │     Determine session mode: Learning / Mixed / Drill
  │     Create practice/session-N/ and stub report.md
  │     Announce to user: "Session N — [mode]. Plan: [warmup topics] + [new topics]"
  │
  ├─ 2. WARMUP (skip if no weak topics)
  │     For each weak/scheduled topic (1–2 max):
  │       → Interview simulation: cold question, no hints, no scaffolding
  │       → Evaluate response
  │       → Update confidence in CLAUDE.md (weak/ok/strong)
  │
  ├─ 3. LEARN (skip if no uncovered topics remain)
  │     For 2–3 new topics per session:
  │       → Socratic teaching: Theory → Practical (logical flow) → Quiz
  │       → Write Theory.md, Practical.md, Summary.md
  │       → Assign initial confidence after quiz
  │       → Update CLAUDE.md status + confidence
  │
  ├─ 4. WRAP UP
  │     Finalise report.md (fill in all sections)
  │     Update CLAUDE.md (all statuses and confidence scores)
  │     Print session summary: what was covered, what's flagged, next session preview
  │
  └─ Offer to continue or stop
```

### Interview Simulation Mode (Warmup)
- No preamble, no hints
- Question types: "Explain X", "Design Y using X", "What's wrong with this design?", "How does X differ from Z?"
- After response: evaluate cold — strong / partial / missed
- If partial/missed: brief correction, then update confidence to `weak` still
- Only promote to `ok` if response is genuinely solid

### Learning Mode (New Topics)
- Socratic, back-and-forth
- Check understanding after each sub-section
- Practical = logical flow discussion (no code files)
- LeetCode connection: identify 1–3 relevant problems from leetcodeproblems.md, discuss how the pattern applies
- Quiz at end: 4–6 questions mixed (conceptual, application, compare/contrast)
- Initial confidence assigned based on quiz: strong performance → ok, shaky → weak

---

## Files to Create/Modify

1. **Create** `practice/` directory with a `.gitkeep` (empty, sessions fill it over time)
2. **Modify** `CLAUDE.md` — add Confidence column to all pattern/concept tables
3. **Rewrite** `.claude/commands/start.md` — new session-aware flow
