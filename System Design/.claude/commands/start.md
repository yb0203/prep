---
# /start — LLD Study Session

Starts a numbered, session-aware LLD study session. Each run creates a session record in `practice/session-N/`, drills weak topics in interview simulation mode, and teaches 2–3 new topics in Socratic mode.

---

## Step 1 — Orient

Read `/Users/yashvi/prep/System Design/CLAUDE.md`.

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
- **Application** — scenario-based: "Would you use [topic] here? Why or why not?"
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
  - Tracker: `CLAUDE.md` at System Design root
  - LeetCode problems: `leetcodeproblems.md` at System Design root

## TTS-Aware Formatting

This session is voice-driven: user speaks via Wispr, Claude's responses are read aloud via Kokoro TTS. Format ALL spoken output for ears, not eyes.

**During the session conversation:**
- Use natural prose — no bullet points, no markdown headers, no symbols
- Spell out pattern/principle names in full on first mention: "the Observer pattern" not "Observer"
- Phrase questions as clean spoken sentences: "What do you think the Factory pattern is solving?" not a bulleted list of sub-questions
- Announce transitions naturally: "Let's start with a warmup question." / "Alright, moving on to a new topic."
- When assessing answers, speak the feedback: "Good, you got the core of it. The one thing you missed was..." not a formatted verdict block
- Never read file paths or markdown syntax aloud — say "I've saved your notes" not "I've written Theory.md"

**Session announcements (Step 1, Step 4)** should sound natural when spoken:
- Good: "This is session four. You've covered twelve out of thirty-nine topics so far. Today we'll do one warmup drill on the Strategy pattern, then move on to two new topics."
- Bad: "**Session 4** — Mixed. Coverage: 12/39 topics complete."

**Files written to disk** (Theory.md, Practical.md, Summary.md, report.md, CLAUDE.md) are exempt — use full markdown there.
