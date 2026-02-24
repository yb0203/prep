# Practice Sessions Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add a session-aware practice system to the LLD knowledge base — each `/start` run creates a numbered session, drills weak topics in interview simulation mode, teaches 2–3 new topics in Socratic mode, and writes a session report.

**Architecture:** Three changes: (1) scaffold `practice/` directory, (2) add Confidence column to CLAUDE.md tracker tables, (3) rewrite `.claude/commands/start.md` with the new two-phase session flow (warmup drill + learning). No code files are ever written during practice — all practical discussion is logical/design only.

**Tech Stack:** Markdown files only. No code, no dependencies.

---

### Task 1: Scaffold the `practice/` directory

**Files:**
- Create: `practice/.gitkeep`

**Step 1: Create the directory with a placeholder**

```bash
mkdir -p /Users/yashvi/prep/interview-prep/LLD/practice
touch /Users/yashvi/prep/interview-prep/LLD/practice/.gitkeep
```

**Step 2: Verify**

```bash
ls /Users/yashvi/prep/interview-prep/LLD/practice/
```
Expected: `.gitkeep`

**Step 3: Commit**

```bash
git -C /Users/yashvi/prep/interview-prep add LLD/practice/.gitkeep
git -C /Users/yashvi/prep/interview-prep commit -m "feat(lld): scaffold practice/ directory for session tracking"
```

---

### Task 2: Add Confidence column to CLAUDE.md — Patterns (Creational)

**Files:**
- Modify: `LLD/CLAUDE.md`

**Step 1: Replace the Creational patterns table**

Find this block in `CLAUDE.md`:
```
## Patterns — Creational (Theory / Practical / Summary)

| Pattern | Theory | Practical | Summary |
|---------|--------|-----------|---------|
| Singleton | [ ] | [ ] | [ ] |
| Factory Method | [ ] | [ ] | [ ] |
| Abstract Factory | [ ] | [ ] | [ ] |
| Builder | [ ] | [ ] | [ ] |
| Prototype | [ ] | [ ] | [ ] |
```

Replace with:
```
## Patterns — Creational (Theory / Practical / Summary / Confidence)

| Pattern | Theory | Practical | Summary | Confidence |
|---------|--------|-----------|---------|------------|
| Singleton | [ ] | [ ] | [ ] | — |
| Factory Method | [ ] | [ ] | [ ] | — |
| Abstract Factory | [ ] | [ ] | [ ] | — |
| Builder | [ ] | [ ] | [ ] | — |
| Prototype | [ ] | [ ] | [ ] | — |
```

**Step 2: Verify the edit looks correct** — read the file and check the table.

---

### Task 3: Add Confidence column — Patterns (Structural)

**Files:**
- Modify: `LLD/CLAUDE.md`

**Step 1: Replace the Structural patterns table**

Find:
```
## Patterns — Structural (Theory / Practical / Summary)

| Pattern | Theory | Practical | Summary |
|---------|--------|-----------|---------|
| Adapter | [ ] | [ ] | [ ] |
| Decorator | [ ] | [ ] | [ ] |
| Facade | [ ] | [ ] | [ ] |
| Composite | [ ] | [ ] | [ ] |
| Proxy | [ ] | [ ] | [ ] |
| Bridge | [ ] | [ ] | [ ] |
| Flyweight | [ ] | [ ] | [ ] |
```

Replace with:
```
## Patterns — Structural (Theory / Practical / Summary / Confidence)

| Pattern | Theory | Practical | Summary | Confidence |
|---------|--------|-----------|---------|------------|
| Adapter | [ ] | [ ] | [ ] | — |
| Decorator | [ ] | [ ] | [ ] | — |
| Facade | [ ] | [ ] | [ ] | — |
| Composite | [ ] | [ ] | [ ] | — |
| Proxy | [ ] | [ ] | [ ] | — |
| Bridge | [ ] | [ ] | [ ] | — |
| Flyweight | [ ] | [ ] | [ ] | — |
```

---

### Task 4: Add Confidence column — Patterns (Behavioral)

**Files:**
- Modify: `LLD/CLAUDE.md`

**Step 1: Replace the Behavioral patterns table**

Find:
```
## Patterns — Behavioral (Theory / Practical / Summary)

| Pattern | Theory | Practical | Summary |
|---------|--------|-----------|---------|
| Strategy | [ ] | [ ] | [ ] |
| Observer | [ ] | [ ] | [ ] |
| Iterator | [ ] | [ ] | [ ] |
| Command | [ ] | [ ] | [ ] |
| Mediator | [ ] | [ ] | [ ] |
| State | [ ] | [ ] | [ ] |
| Template Method | [ ] | [ ] | [ ] |
| Chain of Responsibility | [ ] | [ ] | [ ] |
| Visitor | [ ] | [ ] | [ ] |
| Memento | [ ] | [ ] | [ ] |
```

Replace with:
```
## Patterns — Behavioral (Theory / Practical / Summary / Confidence)

| Pattern | Theory | Practical | Summary | Confidence |
|---------|--------|-----------|---------|------------|
| Strategy | [ ] | [ ] | [ ] | — |
| Observer | [ ] | [ ] | [ ] | — |
| Iterator | [ ] | [ ] | [ ] | — |
| Command | [ ] | [ ] | [ ] | — |
| Mediator | [ ] | [ ] | [ ] | — |
| State | [ ] | [ ] | [ ] | — |
| Template Method | [ ] | [ ] | [ ] | — |
| Chain of Responsibility | [ ] | [ ] | [ ] | — |
| Visitor | [ ] | [ ] | [ ] | — |
| Memento | [ ] | [ ] | [ ] | — |
```

---

### Task 5: Add Confidence column — Concepts

**Files:**
- Modify: `LLD/CLAUDE.md`

**Step 1: Replace the Concepts table**

Find:
```
## Concepts (Theory / Practical / Summary)

| Concept | Theory | Practical | Summary |
|---------|--------|-----------|---------|
| OOP Fundamentals | [ ] | [ ] | [ ] |
| UML | [ ] | [ ] | [ ] |
| Dependency Injection | [ ] | [ ] | [ ] |
| Concurrency | [ ] | [ ] | [ ] |
| Exception Handling | [ ] | [ ] | [ ] |
```

Replace with:
```
## Concepts (Theory / Practical / Summary / Confidence)

| Concept | Theory | Practical | Summary | Confidence |
|---------|--------|-----------|---------|------------|
| OOP Fundamentals | [ ] | [ ] | [ ] | — |
| UML | [ ] | [ ] | [ ] | — |
| Dependency Injection | [ ] | [ ] | [ ] | — |
| Concurrency | [ ] | [ ] | [ ] | — |
| Exception Handling | [ ] | [ ] | [ ] | — |
```

**Step 2: Add Confidence scale legend to the How to Use section**

Find the line:
```
- Status: `[ ]` → `[~]` (in progress) → `[x]` (complete)
```

Replace with:
```
- Status: `[ ]` → `[~]` (in progress) → `[x]` (complete)
- Confidence (patterns & concepts only): `—` (not covered) → `weak` → `ok` → `strong`
  - `weak` → auto-queued in next session's warmup drill
  - `ok` → revisited every 3 sessions
  - `strong` → stable, not scheduled
```

**Step 3: Commit all CLAUDE.md changes**

```bash
git -C /Users/yashvi/prep/interview-prep add LLD/CLAUDE.md
git -C /Users/yashvi/prep/interview-prep commit -m "feat(lld): add Confidence column to CLAUDE.md tracker"
```

---

### Task 6: Rewrite `.claude/commands/start.md`

**Files:**
- Rewrite: `LLD/.claude/commands/start.md`

**Step 1: Replace the entire file with the new session-aware command**

New content:

```markdown
# /start — LLD Study Session

Starts a numbered, session-aware LLD study session. Each run creates a session record in `practice/session-N/`, drills weak topics in interview simulation mode, and teaches 2–3 new topics in Socratic mode.

---

## Step 1 — Orient

Read `/Users/yashvi/prep/interview-prep/LLD/CLAUDE.md`.

Count:
- **Covered topics**: rows where all status cells are `[x]`
- **Weak topics**: rows where Confidence = `weak`, OR Confidence = `ok` AND it has been 3+ sessions since last drilled (check session reports to estimate)
- **New topics**: rows where Theory = `[ ]`

Determine session mode:
- Mostly new topics → **Learning** mode
- Mix of weak + new → **Mixed** mode
- Mostly weak, few/no new → **Drill** mode

Determine session number N:
- Count existing folders in `practice/` and increment by 1
- Create `practice/session-N/` directory
- Create `practice/session-N/report.md` with this stub:

```
# Session N — YYYY-MM-DD

## Session type
Coverage: X/39 topics done | Mode: [Learning / Mixed / Drill]

## Topics covered this session
| Topic | Type | Activity | Outcome |
|-------|------|----------|---------|

## Weak areas — carry forward to Session N+1

## Session notes
```

Announce to user:
> "**Session N** — [Mode]. Coverage: X/39 topics complete."
> "Plan: [list warmup topics if any] + [list new topics to cover today]"

---

## Step 2 — Warmup drill (skip if no weak/scheduled topics)

For each weak topic (max 2 per session):

**Interview simulation — no hints, no scaffolding.**

Open cold with one of these question types (vary each session):
- "Explain [topic] — what problem does it solve and how?"
- "Here's a scenario: [realistic scenario]. Which pattern would you use and why?"
- "What's the difference between [topic] and [closely related topic]?"
- "Walk me through how you'd implement [topic] — just the logical flow, no code needed."

After the user responds:
- **Strong response** → promote confidence: `weak` → `ok`, or `ok` → `strong`. Say what was good.
- **Partial response** → keep confidence as-is. Point out specifically what was missing.
- **Missed** → keep as `weak`. Give a brief targeted correction (2–3 sentences), then offer to revisit in depth later.

Update CLAUDE.md confidence column immediately after each warmup topic.
Add row to session report table: Activity = "Warmup drill", Outcome = new confidence or "still weak".

---

## Step 3 — Learn new topics (skip if all topics covered)

Cover 2–3 new topics per session. For each:

### 3a — Theory (Socratic)

1. **Hook** — one sentence on why this concept exists. Ask: "Have you come across this before?"
2. **Core idea** — plain language + real-world analogy.
3. **Key rules / structure** — walk through the definition, participants, relationships. Pause after each major point: "Does that make sense?"
4. **When to use / not use** — ask the user to guess first, then fill in.
5. **Related concepts** — briefly connect to other topics they've already covered.

Once theory is solid, write `Theory.md` (replace stub):

```
# [Topic Name] — Theory

## What is it?
## Why does it exist?
## Key rules / structure
## When to use
## When NOT to use
## Related concepts
```

Update CLAUDE.md: Theory `[ ]` → `[~]`

### 3b — Practical (logical flow, NO code files)

1. **Logical walkthrough** — describe the structure in plain language ("You'd have an interface X, a concrete class Y that implements it, and a client Z that only knows about X..."). Walk through it step by step. Ask: "What do you think comes next?"
2. **Real-world scenario** — present one realistic scenario and design it together conversationally.
3. **LeetCode connection** — open `leetcodeproblems.md`, identify 1–3 relevant problems. Explain how this topic applies to each. No solving required — just the connection.
4. **Pitfalls** — ask: "What do you think could go wrong with this approach?" Then clarify.

Write `Practical.md` (replace stub):

```
# [Topic Name] — Practical

## Logical structure
## Real-world scenario
## LeetCode Problems
## Pitfalls
```

Update CLAUDE.md: Practical `[ ]` → `[~]`

### 3c — Quiz

4–6 questions. Mix types:
- **Conceptual** — "In one sentence, what does [topic] solve?"
- **Application** — scenario-based: "Would you use [topic] here? Why/why not?"
- **Design** — "Walk me through the logical structure of [topic]."
- **Compare/contrast** — "What's the difference between [topic] and [related]?"

After each answer: acknowledge, add nuance if correct; guide with a hint if partial; explain clearly if missed.

End with a verdict: **strong / solid / needs more practice**. Note gaps.

Assign initial confidence:
- Strong performance → `ok`
- Shaky / notable gaps → `weak`

### 3d — Write Summary.md

Tailor to quiz performance. If the user struggled, make the summary more explicit on those points.

```
# [Topic Name] — Interview Summary

## One-line definition

## Key points
-
-
-

## Distinguishing from similar concepts

## Interview question variants
```

Update CLAUDE.md:
- Theory, Practical, Summary → `[x]`
- Confidence → initial assignment (`ok` or `weak`)

Add row to session report: Activity = "First-time learn", Outcome = assigned confidence.

---

## Step 4 — Wrap up

Finalise `practice/session-N/report.md`:
- Fill in the topics table (all warmup + learning topics)
- Fill in weak areas carry-forward section
- Add any notable observations to session notes

Update all CLAUDE.md statuses and confidence scores (if not already done inline).

Print session summary:
> "**Session N complete.**"
> "Covered: [list of topics]"
> "Flagged for next session: [weak topics]"
> "Next session preview: [1–2 new topics coming up]"

Ask: "Want to continue to the next topic now, or save that for Session N+1?"

If continue → go back to Step 3 and pick the next new topic.
If stop → end session gracefully.

---

## Notes for Claude

- **Principles (no Practical/Summary/Confidence):** For topics in `principles/`, flow is: Theory discussion → Quiz → update Theory to `[x]`. No Practical.md, Summary.md, or Confidence column exists for principles.
- **Session numbering:** Count `practice/session-*/` directories to get N. Start at 1.
- **Logical flow, no code files:** Practical discussion stays conversational. Never write `.java` or other code files during a session.
- **Language if code snippets come up in conversation:** Java by default unless user asks otherwise.
- **Confidence updates are immediate:** Don't batch them — update CLAUDE.md right after each topic is assessed.
- **File paths:**
  - Principles: `principles/[name]/Theory.md`
  - Patterns: `patterns/[type]/[name]/Theory.md`, `Practical.md`, `Summary.md`
  - Concepts: `concepts/[name]/Theory.md`, `Practical.md`, `Summary.md`
  - Session reports: `practice/session-N/report.md`
  - Tracker: `CLAUDE.md` at LLD root
  - LeetCode problems: `leetcodeproblems.md` at LLD root
```

**Step 2: Verify the file was written correctly** — read it back and check all 4 steps are present.

**Step 3: Commit**

```bash
git -C /Users/yashvi/prep/interview-prep add LLD/.claude/commands/start.md
git -C /Users/yashvi/prep/interview-prep commit -m "feat(lld): rewrite /start as session-aware practice command with warmup drill and spaced repetition"
```

---

### Task 7: Final verification

**Step 1: Check all files exist**

```bash
ls /Users/yashvi/prep/interview-prep/LLD/practice/
ls /Users/yashvi/prep/interview-prep/LLD/.claude/commands/
```

Expected: `practice/` contains `.gitkeep`, `.claude/commands/` contains `start.md`

**Step 2: Spot-check CLAUDE.md has Confidence column**

Read `LLD/CLAUDE.md` and verify:
- Creational, Structural, Behavioral, Concepts tables all have `| Confidence |` header and `| — |` cells
- How to Use section has the confidence legend

**Step 3: Spot-check start.md has all 4 steps**

Read `LLD/.claude/commands/start.md` and verify Step 1 (Orient), Step 2 (Warmup), Step 3 (Learn), Step 4 (Wrap up) are all present.

**Step 4: Commit the design doc itself**

```bash
git -C /Users/yashvi/prep/interview-prep add LLD/docs/
git -C /Users/yashvi/prep/interview-prep commit -m "docs(lld): add practice sessions brainstorm and implementation plan"
```
