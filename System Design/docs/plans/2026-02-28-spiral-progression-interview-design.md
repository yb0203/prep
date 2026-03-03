# Spiral Progression Interview System Design

**Date:** 2026-02-28
**Goal:** Prepare for excellent LLD interviews through adaptive mock interviews with broad coverage and strong pattern recognition
**Approach:** Performance-based progression through four difficulty levels, combining isolated pattern mastery with multi-pattern synthesis and full design problem scenarios.

---

## 1. Overview

Replace the traditional "teach then quiz" model with a realistic mock interview system that serves as both assessment and learning mechanism. Sessions are adaptive—difficulty increases based on demonstrated competency in both conceptual understanding and application skills. The system maintains broad coverage across all 65 topics (22 design patterns + 10 OOP concepts + 8 design principles + 5 broader concepts + 33 design problems) while progressively deepening expertise.

---

## 2. Topic Pool

Total coverage: **65 topics**

- **Design Patterns (22):** Creational (5), Structural (7), Behavioral (10). Source: awesome-low-level-design repo.
- **OOP Concepts (10):** abstraction, aggregation, association, classesandobjects, composition, encapsulation, inheritance, interfaces, polymorphism, AggregationVsComposition. Source: awesome-low-level-design repo.
- **Design Principles (8):** SRP, OCP, LSP, ISP, DIP, DRY, KISS, YAGNI. Source: CLAUDE.md (foundational for design decisions).
- **Cross-Cutting Concepts (5):** OOP Fundamentals, UML, Dependency Injection, Concurrency, Exception Handling. Source: CLAUDE.md (applied across all interviews).
- **Design Problems (33):** ATM, Parking Lot, Elevator, Hotel Management, Food Delivery, LinkedIn, Netflix-like systems, etc. Source: awesome-low-level-design/problems/.

---

## 3. Progression Levels (Spiral Model)

Difficulty increases through demonstrated mastery, not time. Movement is performance-based only.

### Level 1: Foundation (Single Pattern/Concept Mastery)

**Focus:** Isolated pattern or OOP concept. Deep understanding before synthesis.

**Interview Type:** Single-topic focused interview.

**Example:** "You're designing a notification system. Walk me through the Observer pattern — what problem does it solve, how would you implement it, what are the trade-offs?"

**Promotion Rule:** Show strong performance (80%+) on 18+ of the 22 patterns, plus all 10 OOP concepts. Ensures broad vocabulary before attempting synthesis.

**Duration:** Typically 8-12 sessions to complete Level 1 (covering 28 topics).

### Level 2: Synthesis (Pattern Pairing & Interaction)

**Focus:** Two or more patterns in a mini-scenario. Test understanding of how patterns interact and when to combine them.

**Interview Type:** Scenario involving multiple patterns.

**Example:** "Design a UI framework where observers notify view updates, but you want to avoid tight coupling. You also need flexible object creation. Which patterns help? How do they work together?"

**Promotion Rule:** Show strong performance on 3+ pattern pair interviews (and at least one OOP principle application). Demonstrates ability to think about pattern combinations.

**Duration:** Typically 4-6 sessions.

### Level 3: Design Problems (Realistic System Scenarios)

**Focus:** Full system design where patterns emerge naturally from requirements, not forced. Architectural thinking, trade-offs, scalability.

**Interview Type:** Pick one of 33 design problems. Design the system from scratch.

**Examples:**
- Design an ATM system (state management, transactions, OOP principles)
- Design a parking lot system (entity modeling, concurrent access, observer pattern)
- Design a food delivery service (search, ordering, notification systems, multiple patterns)

**Promotion Rule:** Show strong performance on 2+ design problems. Demonstrates ability to synthesize patterns in realistic contexts.

**Duration:** Typically 6-10 sessions (one design problem per session).

### Level 4: Complex Scenarios (Mastery)

**Focus:** Large-scale, multi-system design with scale challenges, edge cases, and deep trade-off analysis.

**Interview Type:** Complex design problems with follow-ups on edge cases, performance, failure modes.

**Examples:**
- Design LinkedIn (feed, search, recommendations, concurrency, consistency)
- Design Netflix (streaming, recommendations, regional caching, failure tolerance)
- Design a distributed transaction system (ACID guarantees, failure recovery)

**Promotion Rule:** Automatic once Level 3 is completed. This is the mastery level.

**Duration:** Open-ended (continuous refinement).

---

## 4. Performance Metrics & Grading

After each interview, assessment on two dimensions:

### Conceptual Understanding (50%)

Can you explain the concept/pattern, articulate the problem it solves, discuss trade-offs and alternatives, handle follow-up questions?

**Scoring:**
- **Weak (<60%):** Missing core understanding, significant gaps, struggles with follow-ups.
- **Ok (60-79%):** Core understanding present, some gaps, reasonable follow-up handling.
- **Strong (80%+):** Comprehensive understanding, can articulate trade-offs, handles follow-ups fluently.

### Application Skill (50%)

Can you spot where this concept applies, design a system using it, handle edge cases, make reasonable trade-off decisions?

**Scoring:**
- **Weak (<60%):** Struggles to apply, misses obvious use cases, poor decision-making.
- **Ok (60-79%):** Can apply in straightforward scenarios, occasional gaps in edge cases.
- **Strong (80%+):** Fluent application, anticipates edge cases, makes principled trade-offs.

### Promotion Rules

- **Level 1 → Level 2:** Strong performance on 18+ topics (broad foundational coverage).
- **Level 2 → Level 3:** Strong performance on 3+ pattern pair interviews.
- **Level 3 → Level 4:** Strong performance on 2+ design problems.
- **No Level Penalty for Weak:** Weak performance triggers re-interview within 2-3 sessions, but doesn't push you backward.

---

## 5. Session Selection Algorithm

When `/start` runs, automatically select the next interview topic using this priority order:

1. **Mandatory Remediation:** Topics where you scored "weak" and are due for re-interview (within 2-3 sessions). High priority — close gaps first.

2. **Weak Topic Reinforcement:** Topics where confidence = "ok" and it's been 5+ sessions since last interview. Maintain knowledge, prevent decay.

3. **Uncovered Topics in Current Level:** Pick the next unseen topic at your current progression level (systematic coverage).
   - Level 1: Next uncovered pattern or OOP concept.
   - Level 2: Next uncovered pattern pair combination.
   - Level 3: Next uncovered design problem.
   - Level 4: Revisit complex scenarios with new follow-ups.

4. **Variety:** Alternate between different topic types to maintain cognitive engagement (don't do 5 pattern interviews in a row at Level 1; interleave with OOP concepts).

**Design Problems Entry Point:** Design problems (Level 3) only enter the pool once you reach Level 3. This ensures pattern vocabulary is strong before full system design.

---

## 6. Mock Interview Flow

Each session follows a realistic interview structure:

### Opening (1 minute)

Introduce topic and context. Example: "Today we're talking about the Decorator pattern. You're designing a UI framework where buttons can have different visual styles, borders, and tooltips applied dynamically. Walk me through how you'd design this."

### Questioning Phase (15-20 minutes)

Ask 4-6 questions, varying types:

- **Conceptual:** "Explain the Decorator pattern — what problem does it solve?"
- **Application:** "In the button scenario, where exactly would you use Decorator? Walk me through the design."
- **Design:** "How would you implement this in code? What classes and interfaces?"
- **Trade-offs:** "What are downsides of Decorator? When would you avoid it? What's the alternative?"
- **Edge Cases (Level 3+):** "How does this scale if we have 100s of button decorators? Performance implications?"

Follow-up questions based on answers. **No hints** — this is a real interview. Probe reasoning, depth, and whether understanding is genuine or surface-level.

### Assessment Phase (2-3 minutes)

Explicitly grade: "Your understanding of the core concept is strong. You correctly identified that Decorator solves the problem of adding behavior dynamically without modifying the original class. Where you struggled was discussing performance implications when many decorators are chained — that's important for real systems."

This makes feedback concrete and actionable.

### Educator Phase (5-10 minutes)

Transition from interviewer to teacher. Explain:
- What you got right and why it matters
- Specific gaps and how to think about them
- Trade-offs you didn't consider
- Connection to related patterns (e.g., Decorator vs. Strategy vs. Inheritance)
- Real-world examples where this pattern shines

This is where learning deepens. I'm no longer assessing — I'm teaching based on what I observed.

### Session Report

Create `practice/session-N/report.md` capturing:
- Topic interviewed
- Your grade (weak/ok/strong) on both dimensions
- Key Q&A transcript
- Educator notes on gaps and strengths
- Next recommended focus areas

---

## 7. Documentation Side-Effects

After each interview, write or update three files per topic:

### Theory.md

Captures conceptual understanding. Includes:
- What is it? (definition)
- Why does it exist? (problem solved)
- Key structure / rules (participants, relationships, responsibilities)
- When to use (use cases)
- When NOT to use (anti-patterns, avoid when...)
- Related concepts (how it connects to other patterns/principles)

Informed by your interview performance and educator phase discussion.

### Practical.md

Covers application and design thinking. Includes:
- Logical structure (how to think about building this)
- Real-world scenario (one concrete example from your interview or educator phase)
- LeetCode Problems (1-3 relevant problems from the curated list, showing how this pattern applies)
- Pitfalls (things that went wrong in your interview or common mistakes)

### Summary.md

One-page quick reference for last-minute interview prep:
- One-line definition
- Key points (3-5 bullets)
- Distinguishing from similar concepts (Decorator vs. Strategy, Observer vs. Mediator, etc.)
- Interview question variants (common question forms you should expect)

---

## 8. Progress Tracking

### CLAUDE.md Tracker (Real-Time Updates)

After each interview, update:

- **Status:** `[x]` = strong performance, `[~]` = in progress, `[ ]` = not yet interviewed
- **Confidence:** `—` (not covered) → `weak` → `ok` → `strong`
- **Current Progression Level:** 1, 2, 3, or 4
- **Last Interviewed:** Date of most recent interview for this topic
- **Session Notes:** Key outcome from last interview (gap areas, strengths)

Example row:
```
| Observer Pattern | [x] | [x] | [x] | strong | Lvl 2 | 2026-02-28 | Good grasp of core. Needs work on performance at scale. |
```

### Session History

Each session creates `practice/session-N/report.md`:
- Interview topic
- Your responses (transcript)
- Grading rubric applied
- Scores on conceptual (%) and application (%)
- Overall grade (weak/ok/strong)
- Educator notes and explanations
- Next topic recommendations

Over time, this creates a complete learning record showing progress and growth.

---

## 9. Weak Performance Handling

If you score "weak" on an interview:

1. **Immediate Feedback:** Educator phase focuses on explaining exactly what was missed.

2. **Automatic Re-queue:** Topic automatically queued for re-interview within 2-3 sessions. High priority.

3. **No Level Penalty:** You remain at current level. Weak performance doesn't push you backward; you just don't advance until you demonstrate strength.

4. **Targeted Reteach:** On re-interview, I focus questions on the areas where you struggled previously, then provide deeper educator phase explanation.

5. **Pattern:** If the same topic gets weak twice, deeper remediation in educator phase. If three times, explicit "let's pause and study this together" discussion.

---

## 10. Complete Session Flow

```
1. User runs `/start`
   ↓
2. System selects next interview topic (priority algorithm)
   ↓
3. Opening: Introduce context and topic
   ↓
4. Questioning Phase: 4-6 varied questions, no hints, follow-ups
   ↓
5. Assessment Phase: Explicit grading on both dimensions
   ↓
6. Educator Phase: Explain gaps, trade-offs, connections
   ↓
7. Write/Update: Theory.md, Practical.md, Summary.md
   ↓
8. Update Tracker: CLAUDE.md confidence, status, progression level
   ↓
9. Create Session Report: practice/session-N/report.md
   ↓
10. Session complete. User reviews or starts next session.
```

---

## 11. Path to Excellence

**Your progression path toward excellent LLD interview preparation:**

- **Weeks 1-3 (Level 1):** Build foundational vocabulary. Interview on each of 22 patterns and 10 OOP concepts in isolation. Understand what each solves, when to use, key trade-offs. Broad coverage, moderate depth. ~12 sessions.

- **Weeks 4-5 (Level 2):** Develop synthesis ability. Interview on pattern combinations. Understand how Decorator + Strategy differ, when to use Observer + State together, etc. Moderate coverage, higher depth. ~5 sessions.

- **Weeks 6-10 (Level 3):** Apply to real scenarios. Design ATM, Parking Lot, Food Delivery, Hotel Management, etc. Patterns emerge naturally. Develop architectural thinking, trade-off reasoning. Full coverage, deep mastery. ~8 sessions.

- **Week 11+ (Level 4):** Master complex systems. LinkedIn, Netflix, distributed systems. Demonstrate fluency across all patterns, principles, and concepts in high-pressure realistic scenarios. Ongoing refinement.

**Expected Outcome:** After Level 3, you'll have strong pattern recognition, broad coverage, and proven ability to design real systems. This is what "excellent preparation" looks like for LLD interviews.

---

## 12. Implementation Notes

### awesome-low-level-design Integration

The cloned repo serves as reference material:
- `design-patterns/java/` — I reference implementations when explaining patterns.
- `oop/java/` — I reference OOP examples when teaching concepts.
- `problems/` — Design problem descriptions and sometimes hints at solutions (which I won't reveal during interview, but use for educator phase).
- `class-diagrams/` — Visual references for pattern structure.

### No Code Files Written

During interviews and educator phases, discussions stay conversational. No `.java` or other code files are written to disk. The Theory/Practical/Summary files are markdown-only documentation.

### Language: Java (Default)

When code snippets arise in conversation, default to Java. User can specify otherwise.

### TTS Optimization

All conversational responses follow TTS formatting (natural prose, no markdown in spoken content) with TTS_SUMMARY blocks at the end for audio playback.

---

## 13. Success Criteria

By the end of this program:

✓ You can design any LLD system using appropriate patterns and principles.
✓ You recognize patterns instantly in problem descriptions.
✓ You discuss trade-offs confidently and make reasoned architectural decisions.
✓ You handle follow-up questions and edge cases fluently.
✓ You understand not just "what" each pattern is, but "why" and "when" matter most.

This is broad coverage with strong pattern recognition — the goal you set at the start.
