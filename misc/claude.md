# Claude Interview Prep - Reference Guide

This file documents how to effectively ask Claude questions and use conversational patterns for interview preparation in this directory.

**Note:** These are conversation patterns and prompts you can use, not built-in commands. Just start your conversation with one of the patterns below.

---

## 🎯 Conversational Patterns for Interview Prep

### Interview Preparation Patterns

#### Pattern 1: Company Interview Review
**When to use:** Getting quick overview of company interview prep

**What to say:**
> "Review my Kayhan Space interview preparation. Show me the focus areas, key topics I should study, and what I'm weak in."

**Claude will:**
- Summarize company info and position
- Highlight focus areas (Database, Containerization, System Design)
- Identify weak areas needing work
- Suggest preparation timeline

**Reference files:**
- `companies/kayhan-space/README.md`
- `companies/kayhan-space/conversation_history.md`

---

#### Pattern 2: Project Portfolio Review
**When to use:** Understanding your projects for interviews

**What to say:**
> "Give me a quick overview of my two portfolio projects: Geetha Bay and MS Teams Clone. What makes them interview-worthy?"

**Claude will:**
- Summarize both projects
- Highlight key technologies
- Explain interview value
- Provide talking points

**Reference files:**
- `projects/geetha-bay/README.md`
- `projects/ms-teams-clone/README.md`

---

#### Pattern 3: Mock Interview Practice
**When to use:** Practicing for actual interview questions

**What to say:**
> "Conduct a mock interview for Kayhan Space focusing on databases. Ask me technical questions and evaluate my answers."

Or more specific:
> "I'm interviewing with Kayhan Space in 1 week. Give me a 20-minute mock interview on their main focus areas: databases, containerization, and system design."

**Claude will:**
- Ask realistic technical questions
- Evaluate your answers
- Provide feedback
- Suggest improvements

**Reference files:**
- `companies/kayhan-space/conversation_history.md`
- `technical-topics/databases/README.md`

---

#### Pattern 4: Technical Concept Explanation
**When to use:** Understanding or explaining technical concepts

**What to say:**
> "Explain database indexing clearly, as if you're explaining it in an interview. Include examples and why it matters."

Or:
> "I'm weak on vector databases. Explain this concept from basics to advanced, then show how I used it in Geetha Bay."

**Claude will:**
- Explain from simple to complex
- Provide real-world examples
- Connect to your projects
- Prepare you for interview questions

**Reference files:**
- `technical-topics/[topic]/README.md`
- `projects/geetha-bay/conversation_history.md`

---

#### Pattern 5: Project Deep Dive
**When to use:** Preparing detailed project explanations

**What to say:**
> "Let's do a deep dive on my Geetha Bay project. Walk me through the architecture, discuss design decisions, and prepare me to explain it in an interview."

Or:
> "I need to explain how my MS Teams Clone handles real-time video across different networks. Can we discuss the technical challenges and solutions?"

**Claude will:**
- Explore architecture in detail
- Ask probing questions
- Identify gaps in explanation
- Help you perfect your pitch

**Reference files:**
- `projects/[project]/README.md`
- `projects/[project]/conversation_history.md`

---

#### Pattern 6: Technical Topic Review
**When to use:** Comprehensive learning of a technical topic

**What to say:**
> "Give me a comprehensive review of databases: fundamentals, PostgreSQL specifics, indexing, ACID properties, and how they relate to my projects."

Or:
> "I need to understand system design for Kayhan Space interview. Cover scalability, load balancing, caching, and ask me follow-up questions."

**Claude will:**
- Comprehensive topic overview
- Key concepts and terminology
- Real-world examples
- Follow-up Q&A

**Reference files:**
- `technical-topics/[topic]/README.md`
- Relevant conversation_history.md files

---

#### Pattern 7: Self-Assessment / Weak Areas
**When to use:** Identifying areas needing improvement

**What to say:**
> "Based on what you know about my background, what areas am I weak in for a Kayhan Space interview?"

Or:
> "Test my knowledge on [topic] and tell me honestly where I'm lacking and what I should focus on."

**Claude will:**
- Assess your knowledge
- Identify weak areas
- Suggest focused learning
- Recommend practice areas

---

#### Pattern 8: Resume Bullet Creation
**When to use:** Polishing project descriptions

**What to say:**
> "Create polished resume bullets for my Geetha Bay project. Make them compelling but accurate, showing technical depth."

Or:
> "How should I describe my MS Teams Clone on my resume to highlight full-stack and real-time communication skills?"

**Claude will:**
- Generate polished descriptions
- Create elevator pitches
- Format for ATS
- Make technical and compelling

**Reference files:**
- `projects/[project]/README.md`

---

#### Pattern 9: Interactive Article Reading Session (/read) ✅ SKILL CREATED
**When to use:** Learning and understanding technical articles through conversation

**What to say:**
> "/read system-design-core-concepts"

Or:
> "Start the read session for system design core concepts"

Or:
> "Read article: [article-name]"

**Claude will:**
- Extract and organize article content
- Break down complex topics into digestible sections
- Explain concepts gradually through dialogue
- Pause at key points for discussion
- Answer your questions as you learn
- Build understanding step-by-step
- Maintain a transcript of the session

**How it works:**
1. **Start:** Type `/read [article-name]` to invoke the skill
2. **Progress:** Article is broken into sections, discussed one at a time
3. **Interact:** Ask questions, request clarifications, or ask to pause
4. **Continue:** Say "Continue reading" to move to the next section
5. **Review:** Say "Summarize what we've learned" to recap progress
6. **Test:** Say "Test my understanding" to validate learning

**Skill Location:**
- `.claude/skills/read/SKILL.md` - The actual skill implementation
- `.claude/skills/read/README.md` - Skill documentation

**Reference files:**
- `articles/[article-name]/README.md` - Article overview and progress
- `articles/[article-name]/session_transcript.md` - Full conversation transcript
- `articles/[article-name]/notes.md` - Key concepts and learnings (created during session)

---

## 🎯 Conversation Pattern Quick Reference

### Quick Start Patterns (Say these to Claude)

**For Company Interview Prep:**
> "Review my Kayhan Space interview prep and create a 2-week study plan."

**For Project Discussion:**
> "Deep dive into my Geetha Bay project - walk me through architecture and prepare me to discuss it."

**For Mock Interview:**
> "Conduct a 20-minute mock interview for Kayhan Space focusing on databases."

**For Technical Concepts:**
> "Explain database indexing clearly, as I need to explain it in an interview."

**For Weak Areas:**
> "What are my weak areas for the Kayhan interview and how should I study them?"

**For Resume:**
> "Create polished resume bullets for my Geetha Bay project that show technical depth."

**For Interactive Article Reading:**
> "/read system-design-core-concepts"
> "Start the reading session for system design core concepts"
> "Continue reading system design core concepts"

---

## 📚 Structured Workflows

### Getting Started Workflow
```
1. Say: "Review my Kayhan Space interview preparation"
   Claude: Shows you overview and focus areas

2. Say: "What are my weak areas?"
   Claude: Identifies what you need to work on

3. Say: "Let's start with databases - give me a comprehensive review"
   Claude: Teaches you the topic
```

### Before Interview Workflow
```
1. Say: "Create a 2-week interview prep plan for Kayhan Space"
   Claude: Gives you a structured timeline

2. Say: "Let's do a mock interview on databases"
   Claude: Conducts practice interview

3. Say: "Deep dive into Geetha Bay - help me explain the architecture"
   Claude: Prepares your project explanation
```

### Learning New Topic Workflow
```
1. Say: "I'm weak on [topic] - give me a comprehensive review"
   Claude: Explains topic thoroughly

2. Say: "Ask me questions to test my understanding"
   Claude: Asks follow-up questions

3. Say: "How does this apply to my [project]?"
   Claude: Connects to your real work
```

### Portfolio Discussion Workflow
```
1. Say: "Review both my projects"
   Claude: Summarizes Geetha Bay and MS Teams

2. Say: "Deep dive on MS Teams - focus on real-time systems"
   Claude: Detailed technical discussion

3. Say: "Create resume bullets that highlight my full-stack skills"
   Claude: Polished descriptions
```

### Interactive Article Reading Workflow (/read)
```
1. Say: "/read system-design-core-concepts"
   Claude: Starts the reading session and introduces first section

2. Ask questions: "What does this mean?" or "Can you give an example?"
   Claude: Clarifies concepts as needed

3. Say: "Continue reading"
   Claude: Moves to next section

4. Say: "Summarize what we've learned"
   Claude: Provides recap of key concepts

5. Say: "Test my understanding"
   Claude: Asks questions to validate learning
```

---

## 🎯 Pro Tips for Using These Commands

### For Maximum Learning
1. Start with `/review-kayhan` or `/review-projects`
2. Identify weak areas with `/weak-areas`
3. Deep dive with `/tech-topic [weak-area]`
4. Practice with `/practice-interview [company] [topic]`

### For Interview Day
1. Quick refresh: `/review-kayhan`
2. Confidence boost: `/project-deep-dive geetha-bay`
3. Last minute concept review: `/explain-concept [topic]`

### For Portfolio Discussion
1. Prepare: `/resume-bullets [project]`
2. Deep dive: `/project-deep-dive [project]`
3. Practice: `/practice-interview general architecture`

### For Learning New Topics
1. Start with `/read [article]` for structured content
2. Deep dive with `/tech-topic [topic]` for comprehensive overview
3. Test understanding with `/practice-interview general [topic]`

---

## 📖 Command Reference

| Command | Purpose | Example |
|---------|---------|---------|
| `/review-kayhan` | Kayhan interview prep | Quick company review |
| `/review-projects` | Projects overview | Understand your work |
| `/practice-interview` | Mock interview | `/practice-interview kayhan databases` |
| `/explain-concept` | Concept explanation | `/explain-concept webrtc` |
| `/project-deep-dive` | Project discussion | `/project-deep-dive geetha-bay` |
| `/tech-topic` | Technical review | `/tech-topic system-design` |
| `/interview-strategy` | Company strategy | `/interview-strategy kayhan-space` |
| `/weak-areas` | Identify weaknesses | Self-assessment |
| `/resume-bullets` | Resume descriptions | `/resume-bullets geetha-bay` |
| `/read` | Interactive article learning | `/read system-design-core-concepts` |

---

## 🔄 Typical Workflows

### New Interview (Week 1)
```
/review-kayhan
→ /interview-strategy kayhan-space
→ /practice-interview kayhan databases
→ /practice-interview kayhan system-design
→ /project-deep-dive geetha-bay
```

### Technical Learning (Anytime)
```
/weak-areas
→ /tech-topic [weak-area]
→ /explain-concept [specific-concept]
→ /practice-interview general [topic]
```

### Portfolio Preparation
```
/review-projects
→ /project-deep-dive [project]
→ /resume-bullets [project]
→ /practice-interview general [topic]
```

### Article Reading & Learning
```
/read [article-name]
→ Continue reading through sections
→ Ask questions as needed
→ /practice-interview to test understanding
→ /tech-topic for deeper technical insight
```

---

## 🎓 Learning Paths

### Database Focus (Kayhan Priority)
```
1. /tech-topic databases
2. /explain-concept database-indexing
3. /explain-concept primary-key
4. /explain-concept foreign-key
5. /practice-interview kayhan databases
```

### System Design Focus
```
1. /tech-topic system-design
2. /explain-concept load-balancing
3. /explain-concept caching
4. /practice-interview general architecture
5. /project-deep-dive ms-teams
```

### AI/LLM Focus
```
1. /tech-topic ai-llm
2. /explain-concept rag-system
3. /explain-concept vector-database
4. /project-deep-dive geetha-bay
5. /practice-interview general ai-design
```

### Article-Based Learning Path
```
1. /read system-design-core-concepts
2. Continue through article sections at your own pace
3. Ask clarifying questions throughout
4. /practice-interview general [topic-from-article]
5. /tech-topic [topic-from-article] for deeper dive
```

---

## 💡 Best Practices

### Using These Commands Effectively

1. **Start Broad, Go Deep**
   - Begin with `/review-*` commands
   - Use `/explain-concept` for specific topics
   - Practice with `/practice-interview`

2. **Regular Practice**
   - `/practice-interview` at least 2-3 times per week
   - Focus on weak areas identified by `/weak-areas`
   - Vary topics: databases, system design, project-specific

3. **Project Deep Dives**
   - Use `/project-deep-dive` weekly
   - Practice explaining architecture
   - Prepare for behavioral questions about projects

4. **Before Interviews**
   - Run `/review-kayhan` day before
   - Do `/practice-interview` same morning
   - Quick `/explain-concept` for last-minute topics

5. **Continuous Learning**
   - Use `/tech-topic` for new concepts
   - Reference `/interview-prep/` directory for detailed info
   - Update this claude.md as you learn

---

## 🗂️ Connected Files

These commands reference your interview-prep directory structure:

- **Companies:** `interview-prep/companies/[company]/`
- **Projects:** `interview-prep/projects/[project]/`
- **Topics:** `interview-prep/technical-topics/[topic]/`
- **Learning:** `interview-prep/learning/langchain/`
- **Articles:** `interview-prep/articles/[article-name]/`

All commands automatically reference the correct documentation.

### Special Guides
- **READ Command Guide:** `interview-prep/READ_COMMAND_GUIDE.md` - Complete guide to interactive article reading
- **Articles Index:** `interview-prep/articles/INDEX.md` - List of available articles for reading sessions

---

## 🔗 Quick Links

### Essential Files
- **Master README:** `interview-prep/README.md`
- **Quick Start:** `interview-prep/QUICK_START.md`
- **Completion:** `interview-prep/COMPLETION_SUMMARY.md`

### Company Interview
- **Kayhan Prep:** `interview-prep/companies/kayhan-space/README.md`
- **Kayhan Conversations:** `interview-prep/companies/kayhan-space/conversation_history.md`

### Projects
- **Geetha Bay:** `interview-prep/projects/geetha-bay/README.md`
- **MS Teams:** `interview-prep/projects/ms-teams-clone/README.md`

### Technical Topics
- **Databases:** `interview-prep/technical-topics/databases/README.md`
- **System Design:** `interview-prep/technical-topics/system-design/README.md`

### Article Reading (/read Command)
- **READ Command Guide:** `interview-prep/READ_COMMAND_GUIDE.md`
- **Articles Index:** `interview-prep/articles/INDEX.md`
- **System Design Core Concepts:** `interview-prep/articles/system-design-core-concepts/`

---

## 📋 Interview Checklist

Use these commands before your interview:

```
□ /review-kayhan                    # Refresh company knowledge
□ /practice-interview kayhan databases    # Practice main focus area
□ /project-deep-dive geetha-bay     # Prepare project explanation
□ /project-deep-dive ms-teams       # Secondary project ready
□ /weak-areas                       # Last-minute confidence check
□ /resume-bullets geetha-bay        # Perfect your elevator pitch
```

---

## 🎯 Success Metrics

Track your progress using these commands:

1. **Knowledge:** Can you answer all `/practice-interview` questions confidently?
2. **Depth:** Can you deep-dive on projects without hesitation?
3. **Clarity:** Can you `/explain-concept` simply and accurately?
4. **Confidence:** Do `/weak-areas` answers improve each week?

---

## 🚀 Getting Started

### First Time Setup
1. Save this `claude.md` in `interview-prep/`
2. Familiarize yourself with commands above
3. Start with: `/review-kayhan`
4. Follow with: `/practice-interview kayhan databases`

### Regular Usage
- Use commands daily/weekly as needed
- Reference `interview-prep/` for detailed info
- Update claude.md as you add new companies/projects

### Before Interviews
- Use checklist above (1-2 days before)
- Focus `/practice-interview` on known weak areas
- Build confidence with `/project-deep-dive`

---

## 📞 Support

If you need help:
1. Check the command reference above
2. Review `interview-prep/QUICK_START.md`
3. For `/read` command: See `interview-prep/READ_COMMAND_GUIDE.md`
4. Read relevant `README.md` files
5. Ask Claude directly about any topic

## 🚀 Getting Started with /read Command

To start interactive article reading:

1. Read the guide: Open `READ_COMMAND_GUIDE.md`
2. Try it: Run `/read system-design-core-concepts`
3. Engage: Ask questions and learn conversationally
4. Track: Your progress is saved in the article directory

---

**Last Updated:** January 29, 2026
**Version:** 1.1 (Added /read Command)
**Ready to Use:** Yes ✅

Start with:
- `/review-kayhan` - Company interview prep
- `/review-projects` - Project overview
- `/read system-design-core-concepts` - Interactive article learning
