# LLD Knowledge Base — Progress Tracker

Status legend: `[ ]` = stub/not started · `[~]` = in progress · `[x]` = complete

---

## Principles (Theory.md only)

### OOP Fundamentals

| Concept | Theory |
|---------|--------|
| Introduction to Classes and Objects | [ ] |
| Class Relationships | [ ] |
| Constructors and Types | [ ] |
| This Keyword | [ ] |
| Access Modifiers | [ ] |
| Generics and Wildcards | [ ] |

### OOP Pillars

| Concept | Theory |
|---------|--------|
| Encapsulation | [ ] |
| Abstraction | [ ] |
| Inheritance | [ ] |
| Polymorphism | [ ] |

### Design Principles

| Concept | Theory |
|---------|--------|
| SRP — Single Responsibility Principle | [ ] |
| OCP — Open/Closed Principle | [ ] |
| LSP — Liskov Substitution Principle | [ ] |
| ISP — Interface Segregation Principle | [ ] |
| DIP — Dependency Inversion Principle | [ ] |
| DRY — Don't Repeat Yourself | [ ] |
| KISS — Keep It Simple, Stupid | [ ] |
| YAGNI — You Aren't Gonna Need It | [ ] |

---

## Patterns — Creational (Theory / Practical / Summary / Confidence)

| Pattern | Theory | Practical | Summary | Confidence |
|---------|--------|-----------|---------|------------|
| Singleton | [ ] | [ ] | [ ] | — |
| Factory Method | [ ] | [ ] | [ ] | — |
| Abstract Factory | [ ] | [ ] | [ ] | — |
| Builder | [ ] | [ ] | [ ] | — |
| Prototype | [ ] | [ ] | [ ] | — |

---

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

---

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

---

## Concepts (Theory / Practical / Summary / Confidence)

| Concept | Theory | Practical | Summary | Confidence |
|---------|--------|-----------|---------|------------|
| OOP Fundamentals | [ ] | [ ] | [ ] | — |
| UML | [ ] | [ ] | [ ] | — |
| Dependency Injection | [ ] | [ ] | [ ] | — |
| Concurrency | [ ] | [ ] | [ ] | — |
| Exception Handling | [ ] | [ ] | [ ] | — |

---

## How to Use

- Run `/start` to automatically pick the next uncovered topic and begin a full study session
- Or say "Let's cover [concept name]" to jump to a specific topic
- Claude teaches conversationally, writes the files, quizzes you, then updates this tracker
- Status: `[ ]` → `[~]` (in progress) → `[x]` (complete)
- Confidence (patterns & concepts only): `—` (not covered) → `weak` → `ok` → `strong`
  - `weak` → auto-queued in next session's warmup drill
  - `ok` → revisited every 3 sessions
  - `strong` → stable, not scheduled

---

## LeetCode Problems Integration

**File:** `leetcodeproblems.md` at this directory root contains a curated list of LLD design problems.

**Rule:** Every `Practical.md` file (for patterns and concepts) must include a **LeetCode Problems** section that maps 1–3 relevant problems from `leetcodeproblems.md` to the topic. Claude selects the most relevant problems when writing Practical.md during a `/start` session.

**Mapping guidance:**
- Iterator pattern → #173, #251, #281, #284, #341, #604, #900, #1286
- Observer / Event-driven → #355 Design Twitter, #362 Design Hit Counter
- Singleton → applicable across many design problems (logging, caches)
- Builder → #1628 Expression Tree, #2408 Design SQL
- Factory → #588 In-Memory File System, #1166 Design File System
- Proxy → #146 LRU Cache, #460 LFU Cache
- Decorator → #1381 Stack with Increment, #1670 Front Middle Back Queue
- Facade → #1396 Underground System, #2241 ATM Machine
- Strategy → #384 Shuffle an Array, #855 Exam Room
- State → #353 Design Snake Game, #729 My Calendar I
- Command → #1472 Design Browser History, #2590 Design a Todo List
- Memento → #1472 Design Browser History
- Chain of Responsibility → #359 Logger Rate Limiter, #1797 Authentication Manager
- Composite → #341 Flatten Nested List Iterator, #431 Encode N-ary Tree
- Flyweight → #146 LRU Cache (shared state optimization)
- Bridge / Adapter → #271 Encode and Decode Strings, #535 Encode and Decode TinyURL
- Concurrency → #362 Hit Counter, #981 Time Based Key-Value Store, #1146 Snapshot Array
- OOP Fundamentals → #706 Design HashMap, #705 Design HashSet, #707 Design Linked List
