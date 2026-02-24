# Interview Prep Workflow Guide

**Practical step-by-step guide to using Claude for interview preparation**

---

## 🎯 Three Main Workflows

### Workflow 1: Company Interview Preparation
### Workflow 2: Technical Concept Learning
### Workflow 3: Portfolio/Project Preparation

---

## 📅 WORKFLOW 1: Company Interview Prep (Kayhan Space)

### 🗓️ Timeline: 2 Weeks Before Interview

#### **Week 1: Foundation Building**

**Day 1-2: Company Overview & Strategy**

```
Step 1: Review company materials
You: /review-kayhan

What you get:
- Company background
- Position requirements
- Focus areas (Database, Containerization, System Design)
- Key technologies

Step 2: Create personalized strategy
You: /interview-strategy kayhan-space

What you get:
- Tailored preparation plan
- Likely question areas
- How to reference your projects
- What they value most

Step 3: Self-assess current knowledge
You: /weak-areas

What you get:
- Identified weak areas
- Priority ranking
- Learning recommendations
- Timeline estimates
```

**Action Items After Day 1-2:**
- [ ] Understand Kayhan Space business
- [ ] Know your focus areas
- [ ] Identify 3 weak areas to fix
- [ ] Create prep schedule

---

**Day 3-5: Focus Area Deep Dive #1 (Databases)**

```
Step 1: Comprehensive topic review
You: /tech-topic databases

What you get:
- Full database fundamentals
- PostgreSQL specifics
- Key concepts (indexing, keys, optimization)
- Real-world examples

Step 2: Focus on specific weak concepts
You: /explain-concept database-indexing

Then:
You: /explain-concept primary-key
You: /explain-concept foreign-key
You: /explain-concept query-optimization

What you get:
- Clear explanations
- Interview question examples
- Kayhan-specific relevance

Step 3: Practice with mock interview
You: /practice-interview kayhan databases

What you get:
- Realistic database questions
- Feedback on your answers
- Areas needing improvement
- Confidence building
```

**Action Items After Day 3-5:**
- [ ] Understand database fundamentals
- [ ] Can explain indexing clearly
- [ ] Know primary/foreign key concepts
- [ ] Passed mock interview database questions

---

**Day 6-7: Focus Area Deep Dive #2 (Containerization)**

```
Step 1: Learn containerization
You: /tech-topic containerization

Step 2: Explain specific concepts
You: /explain-concept docker
You: /explain-concept containers-vs-vms

Step 3: Practice containerization questions
You: /practice-interview kayhan containerization

What you get:
- Docker fundamentals
- Container deployment concepts
- Production considerations
- Confidence with topic
```

**Action Items After Day 6-7:**
- [ ] Understand Docker basics
- [ ] Know containerization benefits
- [ ] Can discuss deployment strategies
- [ ] Passed mock interview containerization

---

#### **Week 2: Integration & Refinement**

**Day 8-9: Focus Area Deep Dive #3 (System Design)**

```
Step 1: Learn system design
You: /tech-topic system-design

Step 2: Understand specific patterns
You: /explain-concept load-balancing
You: /explain-concept caching
You: /explain-concept database-sharding

Step 3: Practice design questions
You: /practice-interview kayhan system-design

What you get:
- Scalability patterns
- Architecture thinking
- Design trade-offs
- System design confidence
```

**Action Items After Day 8-9:**
- [ ] Understand design patterns
- [ ] Can discuss scaling strategies
- [ ] Passed mock interview system design
- [ ] Integrated all 3 focus areas

---

**Day 10-11: Project Preparation**

```
Step 1: Deep dive Geetha Bay
You: /project-deep-dive geetha-bay

Follow-ups:
You: How would Kayhan benefit from this technology?
You: What would I do differently for their use case?

Step 2: Deep dive MS Teams
You: /project-deep-dive ms-teams

Follow-ups:
You: How does this show full-stack ability?
You: What real-time challenges did I solve?

Step 3: Polish your descriptions
You: /resume-bullets geetha-bay
You: /resume-bullets ms-teams

What you get:
- Clear project explanations
- Talking points ready
- Examples for interview
- Confidence discussing work
```

**Action Items After Day 10-11:**
- [ ] Can explain both projects in detail
- [ ] Know architecture decisions
- [ ] Prepared talking points
- [ ] Ready to reference projects

---

**Day 12-13: Integration Practice**

```
Step 1: Full mock interview - Databases
You: /practice-interview kayhan databases

Step 2: Full mock interview - System Design
You: /practice-interview kayhan system-design

Step 3: Re-assess weaknesses
You: /weak-areas

Follow-up:
You: How can I improve on [area]?

Step 4: Quick concept refreshers
You: /explain-concept [any weak concept]

What you get:
- Improved confidence
- Identified remaining gaps
- Focused improvement areas
- Interview readiness assessment
```

**Action Items After Day 12-13:**
- [ ] Can answer most questions confidently
- [ ] Know remaining weak areas
- [ ] Have specific improvement plan
- [ ] Feeling ready for interview

---

**Day 14: Final Prep**

```
Morning:
You: /review-kayhan (quick refresh)

Follow-up:
You: What are the top 3 things I should emphasize?

Afternoon:
You: /practice-interview kayhan databases (confidence builder)

Evening:
You: /resume-bullets geetha-bay (mental rehearsal)

Night:
- Early sleep
- Clear mind
- Ready to go

What you've accomplished:
✓ Learned database fundamentals
✓ Learned containerization
✓ Learned system design
✓ Practiced with mock interviews
✓ Prepared project explanations
✓ Built confidence
```

**Day 14 Checklist:**
- [ ] Did quick Kayhan review
- [ ] Did confidence-building mock interview
- [ ] Reviewed project talking points
- [ ] Got good sleep
- [ ] Ready for interview tomorrow

---

## 📚 WORKFLOW 2: Technical Concept Learning

### 🎯 Scenario: Found weak area in system design

```
Week 1: Foundation
┌─────────────────────────────────────────┐
│ Step 1: Identify the gap               │
│ /weak-areas                            │
│ → Identifies: "System design at scale" │
└─────────────────────────────────────────┘
            ↓
┌─────────────────────────────────────────┐
│ Step 2: Learn comprehensive topic      │
│ /tech-topic system-design              │
│ → Covers all patterns and concepts     │
└─────────────────────────────────────────┘
            ↓
┌─────────────────────────────────────────┐
│ Step 3: Deep dive specific concepts    │
│ /explain-concept load-balancing        │
│ /explain-concept caching               │
│ /explain-concept database-replication  │
└─────────────────────────────────────────┘

Week 2: Practice & Application
┌─────────────────────────────────────────┐
│ Step 4: Practice with interviews       │
│ /practice-interview general system-design │
│ → Do this 3-4 times this week          │
│ → Get feedback and improve             │
└─────────────────────────────────────────┘
            ↓
┌─────────────────────────────────────────┐
│ Step 5: Apply to real projects         │
│ /project-deep-dive ms-teams            │
│ → How does this apply to real design?  │
│ → Ask follow-up questions              │
└─────────────────────────────────────────┘
            ↓
┌─────────────────────────────────────────┐
│ Step 6: Re-assess improvement          │
│ /weak-areas                            │
│ → Check if system design improved      │
│ → Identify next weak area              │
└─────────────────────────────────────────┘
```

---

## 💼 WORKFLOW 3: Portfolio/Project Preparation

### 🎯 Scenario: Preparing for portfolio-focused interview

```
Timeline: 1 Week

Day 1-2: Project Overview
┌────────────────────────────────────────┐
│ You: /review-projects                  │
│                                        │
│ Get overview of both projects          │
│ Understand what makes them strong      │
│ Prepare talking points                 │
└────────────────────────────────────────┘

Day 3-4: Geetha Bay Deep Dive
┌────────────────────────────────────────┐
│ You: /project-deep-dive geetha-bay     │
│                                        │
│ Explore RAG system architecture        │
│ Discuss design decisions               │
│ Prepare detailed explanation           │
│                                        │
│ Follow-ups:                            │
│ "How would I handle 10M requests?"     │
│ "What would I do differently?"         │
│ "How does this show my skills?"        │
└────────────────────────────────────────┘
       ↓
│ You: /resume-bullets geetha-bay        │
│                                        │
│ Get polished resume description        │
│ Practice elevator pitch                │
│ Prepare for "tell me about..." q's     │
└────────────────────────────────────────┘

Day 5-6: MS Teams Deep Dive
┌────────────────────────────────────────┐
│ You: /project-deep-dive ms-teams       │
│                                        │
│ Explore real-time communication        │
│ Discuss WebRTC implementation          │
│ Deployment challenges                  │
│                                        │
│ Follow-ups:                            │
│ "How would you scale this?"            │
│ "What were the hardest problems?"      │
│ "Why these tech choices?"              │
└────────────────────────────────────────┘
       ↓
│ You: /resume-bullets ms-teams          │
│                                        │
│ Get polished resume description        │
│ Practice technical explanation         │
│ Prepare architecture discussion        │
└────────────────────────────────────────┘

Day 7: Practice Discussion
┌────────────────────────────────────────┐
│ You: /practice-interview general       │
│         system-design                  │
│                                        │
│ Design a system like your projects     │
│ Show architectural thinking            │
│ Reference your real implementation     │
└────────────────────────────────────────┘
```

---

## 🕐 Daily 15-Minute Practice Routines

### Option A: Technical Concept Focus
```
Time: 15 minutes
Purpose: Learn new concept

5 min:  /explain-concept [new-concept]
        Read and understand explanation

5 min:  Think of follow-up questions
        Ask Claude clarifying questions

5 min:  Connect to your projects
        "How does this apply to Geetha Bay?"
```

### Option B: Project Focus
```
Time: 15 minutes
Purpose: Improve project explanations

5 min:  Review project README
        /projects/geetha-bay/README.md

5 min:  Ask deep questions
        "How would you handle [scaling issue]?"
        "What would you do differently?"

5 min:  Perfect your explanation
        Practice explaining architecture aloud
```

### Option C: Interview Practice
```
Time: 15 minutes
Purpose: Build confidence with questions

5 min:  /practice-interview kayhan [topic]
        Answer question from Claude

5 min:  Get feedback
        Understand what you missed

5 min:  Re-answer question
        Show improvement
```

---

## ✅ Quick Checklists

### Before Company Interview
```
□ 1 Week Before:
  □ /review-kayhan
  □ /interview-strategy kayhan-space
  □ /weak-areas

□ 3 Days Before:
  □ /tech-topic databases
  □ /practice-interview kayhan databases

□ 1 Day Before:
  □ /practice-interview kayhan [all topics]
  □ /project-deep-dive geetha-bay

□ Morning Of:
  □ /review-kayhan (quick)
  □ /practice-interview kayhan databases
  □ /resume-bullets geetha-bay
```

### When Learning New Topic
```
□ Day 1:
  □ /tech-topic [topic]
  □ /explain-concept [specific concept]

□ Day 2:
  □ /explain-concept [other concepts]
  □ /practice-interview general [topic]

□ Day 3:
  □ /practice-interview general [topic] (again)
  □ /project-deep-dive [related project]
```

### Weekly Routine
```
□ Monday: /weak-areas (assess)
□ Tuesday: /tech-topic [weak area]
□ Wednesday: /practice-interview [topic]
□ Thursday: /project-deep-dive [project]
□ Friday: /practice-interview [topic] (again)
```

---

## 🎯 Decision Tree: Which Command to Use?

```
Do you have an interview coming up?
├─ YES → /review-kayhan → /interview-strategy kayhan-space
└─ NO → Continue below

Do you want to learn something new?
├─ YES → /tech-topic [topic] → /explain-concept [concept]
└─ NO → Continue below

Do you want to practice interview questions?
├─ YES → /practice-interview [company] [topic]
└─ NO → Continue below

Do you want to improve your project discussion?
├─ YES → /project-deep-dive [project] → /resume-bullets [project]
└─ NO → You're good! Just practice regularly

Want to assess yourself?
└─ YES → /weak-areas
```

---

## 📊 Progress Tracking

### Weekly Metrics

Track these to see improvement:

```
Week 1: Baseline
- /weak-areas (identified weak topics)
- First /practice-interview score: 60%

Week 2: Learning
- /tech-topic [topic] completed
- /practice-interview score: 70%

Week 3: Consolidation
- Multiple /practice-interview: 80%+
- /weak-areas much improved

Week 4: Ready
- Mock interviews confident
- Ready for real interview
```

### Sample Progress Log

```
Monday: /weak-areas
→ Identified: Database indexing weak

Tuesday: /tech-topic databases
→ Learned comprehensive fundamentals

Wednesday: /practice-interview kayhan databases
→ Score: 7/10 (improved from 5/10)

Thursday: /explain-concept database-indexing
→ Now can explain clearly

Friday: /practice-interview kayhan databases
→ Score: 9/10 (much improved!)

Notes: Feeling confident on databases now. Next focus: system design.
```

---

## 🚀 Getting Started Right Now

### Start Here (Next 30 minutes):

```
1. Read this entire workflow guide (10 min)
2. Review /claude.md for commands (5 min)
3. Start with: /review-kayhan (5 min)
4. Do first: /practice-interview kayhan databases (10 min)
```

### This Week:

```
- Follow Workflow 1: Company Interview Prep
- Do 3 /practice-interview sessions
- Complete one /tech-topic
- One /project-deep-dive
```

### Next Interview:

```
- Use this entire workflow guide
- Follow timeline for preparation
- Track progress with checklists
- Adjust based on your pace
```

---

## 💡 Pro Tips

### Tips for Success

1. **Be Specific:** Use exact command syntax
   - ✓ `/practice-interview kayhan databases`
   - ✗ `practice interview`

2. **Follow the Workflow:** Don't skip steps
   - Review first, then deep-dive, then practice

3. **Practice Multiple Times:** Do each interview question 3 times
   - First: Awkward and incomplete
   - Second: Better but missing details
   - Third: Confident and complete

4. **Reference Your Files:** Go deep into /interview-prep/ docs
   - Read full conversation_history.md for context
   - Review README.md files for details

5. **Adjust to Your Pace:** Take what you need
   - Fast learner? Skip some explanation steps
   - Need more time? Spend extra week learning

6. **Track Your Progress:** See what's working
   - Note which commands help most
   - Update this guide with your findings

---

## 🎓 Example: Real 2-Week Journey

**Monday (Day 1):**
- `/review-kayhan` → Feels unprepared, 30% confident
- Note weak areas: databases, system design

**Tuesday (Day 2):**
- `/interview-strategy kayhan-space` → Understand plan
- `/weak-areas` → Confirms weak areas

**Wednesday (Day 3):**
- `/tech-topic databases` → Learn fundamentals
- Starting to understand indexing

**Thursday (Day 4):**
- `/explain-concept database-indexing` → Clear understanding
- `/practice-interview kayhan databases` → Score 5/10

**Friday (Day 5):**
- `/practice-interview kayhan databases` → Score 6/10 (improving!)
- Feeling better about concepts

**Weekend:** Rest and absorb

**Monday (Day 8):**
- `/tech-topic system-design` → Learning new topic
- Cross-reference with MS Teams project

**Tuesday (Day 9):**
- `/practice-interview kayhan system-design` → Score 6/10
- Getting better at design thinking

**Wednesday (Day 10):**
- `/project-deep-dive geetha-bay` → Detailed discussion
- Confidence building on portfolio

**Thursday (Day 11):**
- `/practice-interview kayhan databases` → Score 9/10 (great improvement!)
- `/practice-interview kayhan system-design` → Score 7/10

**Friday (Day 12):**
- `/weak-areas` → Identified what still needs work
- Focused remaining time on top gaps

**Saturday (Day 13):**
- Final `/practice-interview kayhan databases` → Score 9/10
- `/practice-interview kayhan system-design` → Score 8/10

**Sunday (Day 14):**
- `/review-kayhan` → Quick mental refresh
- `/project-deep-dive geetha-bay` → Build confidence
- Prepare for Monday interview

**Result:**
- Started 30% confident
- Ended 85% confident
- Ready for interview!

---

## ❓ FAQ

**Q: How long does one command take?**
A:
- `/review-*` → 10-15 minutes
- `/tech-topic` → 20-30 minutes
- `/explain-concept` → 5-10 minutes
- `/practice-interview` → 15-25 minutes
- `/project-deep-dive` → 20-30 minutes

**Q: How often should I practice?**
A:
- If preparing for interview: Daily
- Regular practice: 3-4 times per week
- Minimum: 1 mock interview per week

**Q: Which commands are most important?**
A: Priority order:
1. `/practice-interview [company] [topic]` (most important)
2. `/tech-topic [topic]` (understanding)
3. `/project-deep-dive [project]` (confidence)
4. `/explain-concept [concept]` (clarification)
5. `/weak-areas` (assessment)

**Q: Can I skip steps?**
A: Generally no - follow the workflow. But if time-constrained:
1. Keep: `/review-kayhan` → `/practice-interview` → `/project-deep-dive`
2. Skip: Some `/explain-concept` steps
3. Reduce: Number of practice rounds

**Q: How do I know if I'm ready?**
A: When:
- ✓ Can answer most `/practice-interview` questions confidently
- ✓ Can deep-dive your projects without hesitation
- ✓ Can explain technical concepts clearly
- ✓ Feel ready (confidence > nervousness)

---

**Version:** 1.0
**Last Updated:** January 29, 2026
**Ready to Use:** Yes ✅

**Start now with:** `/review-kayhan` or `/review-projects`
