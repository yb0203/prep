# Spiral Progression Interview System

An adaptive mock interview system for mastering Low-Level Design (LLD) concepts through realistic interview simulations with performance-based progression.

## Quick Start

### Run Your First Interview

```bash
/start
```

The system will:
1. Analyze your current progress
2. Select the next interview topic (intelligent selection based on weak areas)
3. Initialize a new session
4. Run a realistic 4-phase mock interview
5. Update your progress tracker

### What to Expect

**Interview Flow:**
- **Opening** - Interviewer introduces the topic and context
- **Questioning** - 4-6 questions testing understanding and application (no hints)
- **Assessment** - Explicit grading on two dimensions:
  - Conceptual Understanding (50%): Can you explain the concept?
  - Application Skill (50%): Can you apply it in real scenarios?
- **Educator** - Interviewer explains gaps, trade-offs, connections to other patterns

**Grades:**
- **Weak** (<60%) - Topic queued for re-interview within 2-3 sessions
- **Ok** (60-79%) - Topic cycled back every 5 sessions for reinforcement
- **Strong** (80%+) - Topic progresses toward next level

## Progression Levels

The system has 4 difficulty levels. You progress by demonstrating strong performance:

| Level | Focus | Topics | Progression Rule |
|-------|-------|--------|------------------|
| 1 | **Foundation** - Single pattern/concept mastery | 28 (22 patterns + 10 OOP) | Strong on 18+ topics |
| 2 | **Synthesis** - Pattern combinations | Pattern pairs | Strong on 3+ pair interviews |
| 3 | **Design Problems** - Full system design | 33 problems | Strong on 2+ problems |
| 4 | **Complex** - Large-scale architecture | Complex scenarios | Automatic (mastery) |

## Your Progress Tracker

View real-time progress in `CLAUDE.md`:

```
Current Level: 1 (Foundation)
Sessions Completed: 0
Topics Strong: 0/78
Topics Ok: 0/78
Topics Weak: 0/78
```

**Columns explain:**
- **Status**: `[ ]` uncovered, `[~]` in progress, `[x]` complete
- **Confidence**: `—` not covered, `weak`, `ok`, `strong`
- **Level**: Current progression level (1-4)
- **Last Interviewed**: Most recent session date
- **Notes**: Key observations from interview

## Topics Covered (78 Total)

### Design Patterns (22)
**Creational:** Singleton, Factory Method, Abstract Factory, Builder, Prototype
**Structural:** Adapter, Decorator, Facade, Composite, Proxy, Bridge, Flyweight
**Behavioral:** Strategy, Observer, Iterator, Command, Mediator, State, Template Method, Chain of Responsibility, Visitor, Memento

### OOP Concepts (10)
Classes, Encapsulation, Abstraction, Inheritance, Polymorphism, Composition, Aggregation, Association, Interfaces, Aggregation vs Composition

### Design Principles (8)
SRP, OCP, LSP, ISP, DIP, DRY, KISS, YAGNI

### Cross-Cutting Concepts (5)
OOP Fundamentals, UML, Dependency Injection, Concurrency, Exception Handling

### Design Problems (33)
ATM, Parking Lot, Elevator, Hotel Management, Library, Movie Ticket Booking, Airline Management, Concert Tickets, Course Registration, Cricinfo, Digital Wallet, Food Delivery, Chess Game, Coffee Vending, Car Rental, Logging Framework, LRU Cache, Amazon Locker, Book My Show, Uber, TikTok, Dropbox, Google Maps, LinkedIn, Twitter, Spotify, Netflix, Instagram, Discord, Slack, Messenger, WhatsApp, and more.

## Session Structure

Each interview creates a session report in `practice/session-N/report.md` containing:

- **Interview Context** - The scenario you were given
- **Transcript** - Your answers to all questions
- **Assessment** - Scores on conceptual and application dimensions
- **Educator Notes** - Explanations of gaps and trade-offs
- **Progression Status** - Updated confidence level and next steps

## Key Files

```
System Design/
├── CLAUDE.md                           # Real-time progress tracker (78 topics)
├── README.md                           # This file
├── docs/plans/
│   ├── 2026-02-28-spiral-progression-interview-design.md
│   └── 2026-02-28-spiral-progression-implementation.md
├── practice/
│   ├── session-0/report.md             # Session template
│   ├── session-1/report.md             # First interview
│   └── session-N/report.md             # Your sessions
├── awesome-low-level-design/           # Reference repo (patterns, OOP, problems)
└── .claude/
    ├── commands/start.md               # /start command documentation
    └── scripts/
        ├── select-interview-topic.sh    # Topic selection algorithm
        ├── init-session.sh              # Session initialization
        └── update-tracker.sh            # Progress tracking
```

## Command Reference

### `/start`
Begins a new mock interview session. The system automatically:
- Selects the next topic (priority: remediation → weak topics → uncovered topics → variety)
- Initializes the session
- Runs the 4-phase interview
- Updates your progress tracker

### Direct Topic (Alternative)
```
Let's cover [topic name]
```
Jump directly to a specific topic without auto-selection.

## Strategy for Success

### Level 1 Strategy (Foundation)
Focus on building broad vocabulary across all 22 patterns and 10 OOP concepts.

**Goal:** Demonstrate strong understanding of each concept in isolation
- Expect ~8-12 sessions to cover all Level 1 topics
- Weak topics automatically re-queued within 2-3 sessions
- Once 18+ topics are strong, advance to Level 2

### Level 2 Strategy (Synthesis)
Learn how patterns work together and when to combine them.

**Goal:** Show you understand pattern interactions
- Interview on pattern pairs (e.g., "Observer + Decorator")
- Expect ~4-6 sessions for sufficient pattern combination practice
- Once 3+ pair interviews are strong, advance to Level 3

### Level 3 Strategy (Design Problems)
Apply patterns naturally in realistic system design scenarios.

**Goal:** Design complete systems using appropriate patterns
- Interview on design problems (ATM, Parking Lot, Food Delivery, LinkedIn, etc.)
- Patterns should emerge naturally from requirements
- Expect ~6-10 sessions covering different problem domains
- Once 2+ design problems are strong, advance to Level 4

### Level 4 Strategy (Complex Scenarios)
Master large-scale, multi-system design with edge cases.

**Goal:** Confidently design complex systems with deep trade-off analysis
- Large-scale problems (Netflix, Uber, Discord)
- Emphasis on scalability, consistency, failure handling
- Open-ended mastery (no fixed endpoint)

## Tips for Better Interviews

1. **Take your time** - Think through your answers before responding
2. **Ask clarifying questions** - In real interviews, you can ask for clarification
3. **Explain your reasoning** - Show your thought process, not just the answer
4. **Discuss trade-offs** - Patterns have pros and cons; mention them
5. **Connect to related concepts** - Show how one pattern relates to others
6. **Learn from feedback** - Educator phase explains what you missed; internalize it
7. **Review between sessions** - Read the session report to reinforce learning

## System Architecture

The system uses a spiral progression model:

```
Foundation (isolated topics)
    ↓ [18+ strong]
Synthesis (pattern pairs)
    ↓ [3+ pair interviews strong]
Design Problems (full systems)
    ↓ [2+ problems strong]
Complex Scenarios (mastery)
```

**Weak Performance Handling:**
Weak scores don't push you backward. Instead, the system re-interviews the topic within 2-3 sessions, giving you a chance to strengthen your understanding before progressing.

**Performance-Based Only:**
Progression is entirely based on demonstrated competency, not time or number of sessions.

## Resources

- **awesome-low-level-design/** - Cloned reference repository with patterns, OOP, class diagrams, and problem descriptions
- **CLAUDE.md** - Detailed tracker with all progression rules and topic definitions
- **session-N/report.md** - Your personal interview records and feedback
- **docs/plans/** - Design documents and implementation details

## Getting Help

If you get stuck on a topic:
1. Ask for clarification during the educator phase
2. Request a re-interview on that topic in the next session
3. Review the awesome-low-level-design reference materials
4. Check related patterns for similar concepts

## Ready to Begin?

```bash
/start
```

Start with Level 1 Foundation topics. The system will guide you through 4 phases of realistic interviewing, building toward mastery through adaptive, performance-based progression.

Good luck! 🚀
