# Interview Prep Commands - Complete Guide

**Reference:** Full command syntax and examples for interview preparation

---

## 🎯 Command Categories

### Category 1: Company Interview Prep
Commands specifically for preparing for company interviews.

### Category 2: Project Portfolio
Commands for discussing and explaining your projects.

### Category 3: Technical Concepts
Commands for learning and explaining technical topics.

### Category 4: Practice & Feedback
Commands for mock interviews and self-assessment.

---

## 📋 Command Syntax & Examples

### COMPANY INTERVIEW PREP

#### `/review-kayhan`
**Purpose:** Quick review of Kayhan Space interview preparation

**What it does:**
- Shows company overview
- Lists focus areas
- Displays key preparation topics
- Lists sample interview questions

**Example Usage:**
```
You: /review-kayhan
Claude: [Shows Kayhan Space interview prep overview with focus areas]
```

**Best Time:** Before starting Kayhan prep, day before interview, when you need quick refresh

**Follow-up:** Ask follow-up questions like:
- "What should I focus on most?"
- "Can you drill me on databases?"
- "How should I discuss my projects with them?"

---

#### `/interview-strategy kayhan-space`
**Purpose:** Get personalized interview strategy for Kayhan Space

**What it does:**
- Analyzes their tech stack
- Identifies likely question areas
- Provides strategy for discussion
- Suggests how to reference your projects

**Example Usage:**
```
You: /interview-strategy kayhan-space
Claude: [Provides detailed interview strategy for Kayhan]
```

**Best Time:** 1-2 days before interview

**Follow-up:** Ask for:
- "How should I structure my answers?"
- "What questions should I ask them?"
- "How do I connect my projects to their needs?"

---

### PRACTICE INTERVIEWS

#### `/practice-interview kayhan databases`
**Purpose:** Mock interview for Kayhan Space focusing on databases

**What it does:**
- Asks realistic technical database questions
- Evaluates your answers
- Provides feedback
- Suggests improvements

**Example Usage:**
```
You: /practice-interview kayhan databases
Claude: I'll conduct a mock interview focusing on databases.

Claude: Let's start. Question 1: Can you explain what database indexing is and why it matters?

You: [Your answer about indexing]

Claude: [Evaluates your answer, provides feedback, asks follow-up]
```

**Best Time:** 1 week before and 2 days before interview

**Topics to practice:**
- `/practice-interview kayhan databases`
- `/practice-interview kayhan containerization`
- `/practice-interview kayhan system-design`

**Pro Tip:** Do each topic multiple times to build confidence

---

#### `/practice-interview general api-design`
**Purpose:** General mock interview on REST API design

**What it does:**
- Tests API design knowledge
- Asks for design decisions
- Evaluates architectural thinking

**Example Usage:**
```
You: /practice-interview general api-design
Claude: Let's practice API design. Question: Design a REST API for a video conferencing app.

You: [Your API design answer]

Claude: [Provides feedback and follow-up questions]
```

**Best Time:** Regular practice, anytime

**General Topics:**
- `/practice-interview general system-design`
- `/practice-interview general databases`
- `/practice-interview general architecture`

---

### PROJECT PORTFOLIO

#### `/project-deep-dive geetha-bay`
**Purpose:** Deep dive discussion about Geetha Bay project

**What it does:**
- Explores project architecture in detail
- Discusses design decisions
- Prepares you to explain it in interviews
- Generates talking points

**Example Usage:**
```
You: /project-deep-dive geetha-bay
Claude: Let's discuss Geetha Bay in detail.

Claude: First, can you walk me through the architecture from PDF input to user response?

You: [Explain your architecture]

Claude: [Follows up with detailed questions about design decisions]
```

**Best Time:** Before any interview, weekly practice

**Questions it helps with:**
- "Tell me about a project you're proud of"
- "Walk me through your project architecture"
- "How would you scale this project?"
- "What challenges did you face?"

---

#### `/project-deep-dive ms-teams`
**Purpose:** Deep dive on MS Teams Clone project

**What it does:**
- Explores real-time communication architecture
- Discusses WebRTC implementation
- Explains deployment decisions
- Prepares for system design questions

**Example Usage:**
```
You: /project-deep-dive ms-teams
Claude: Let's explore MS Teams Clone.

Claude: How did you handle video streaming across different networks?

You: [Explain STUN/TURN servers and WebRTC]

Claude: [Asks deeper questions about architecture]
```

**Best Time:** For companies asking about real-time systems

---

#### `/resume-bullets geetha-bay`
**Purpose:** Polish resume description for Geetha Bay

**What it does:**
- Generates polished resume bullets
- Creates compelling descriptions
- Prepares elevator pitch
- Formats for ATS and human readers

**Example Usage:**
```
You: /resume-bullets geetha-bay
Claude: Here are polished resume bullets for Geetha Bay:

• Built a production-grade RAG chatbot using LangChain, Pinecone vector search,
  and OpenAI embeddings to provide contextual responses from 700+ religious verses
• Implemented vector similarity search for intelligent context retrieval with
  automatic LLM-based verse tagging
• Developed content moderation system with topic filtering, crisis detection,
  and prompt injection protection
• Achieved 1st Runner-up in 2-day hackathon demonstrating rapid prototyping skills
```

**Best Time:** Before updating resume, before portfolio interviews

---

### TECHNICAL CONCEPTS

#### `/explain-concept vector-database`
**Purpose:** Explain vector databases clearly

**What it does:**
- Simple explanation first
- Builds to complex details
- Provides examples
- Connects to your projects

**Example Usage:**
```
You: /explain-concept vector-database
Claude: Let me explain vector databases:

[Simple explanation]
A vector database stores data as numerical vectors and retrieves them by similarity.
Think of it like organizing documents by meaning rather than exact keywords.

[Example]
In your Geetha Bay project, you converted verses into vectors using OpenAI embeddings,
then used Pinecone to find similar verses when a user asks a question.

[How it works]
[Detailed explanation of embeddings, similarity search, and indexing]

[Interview questions this helps with]
- "How do vector databases work?"
- "Why did you choose Pinecone?"
- "How would you optimize vector search?"
```

**Best Time:** When learning a new concept, before interview questions on topic

**Common Concepts to Explain:**
- `/explain-concept rag-system` - Retrieval Augmented Generation
- `/explain-concept database-indexing` - Index data structures
- `/explain-concept webrtc` - Peer-to-peer communication
- `/explain-concept oauth` - OAuth 2.0 flow
- `/explain-concept load-balancing` - Distributing traffic
- `/explain-concept caching` - Performance optimization

---

#### `/tech-topic databases`
**Purpose:** Full technical topic review on databases

**What it does:**
- Comprehensive overview of topic
- Key concepts and terminology
- Real-world examples
- Interview preparation

**Example Usage:**
```
You: /tech-topic databases
Claude: Let's cover databases comprehensively:

[Fundamentals]
- What databases are
- Types of databases
- When to use which

[PostgreSQL Specifics]
- Architecture
- Data types
- Constraints

[Key Concepts]
- Indexing (with examples)
- Primary/Foreign keys
- ACID properties
- Query optimization

[Interview Q&A]
Q: What is a primary key?
A: [Your answer]
Claude: [Feedback]

[Your Kayhan Interview]
Kayhan likely uses PostgreSQL or Supabase...
```

**Best Time:** Start of learning topic, before focused practice

**Major Topics:**
- `/tech-topic databases`
- `/tech-topic system-design`
- `/tech-topic real-time-communication`
- `/tech-topic ai-llm`

---

### SELF-ASSESSMENT

#### `/weak-areas`
**Purpose:** Identify areas you might struggle with

**What it does:**
- Assesses your current knowledge
- Identifies weak areas
- Suggests focused learning
- Provides practice recommendations

**Example Usage:**
```
You: /weak-areas
Claude: Based on our conversation, here are potential weak areas:

[Identified Weak Areas]
1. Database query optimization - You seemed uncertain about indexing strategies
2. Containerization concepts - Need more Docker experience discussion
3. System design at scale - Good basics but missing distributed system concepts

[Recommendations]
1. Focus on: /tech-topic databases
2. Then: /practice-interview kayhan databases
3. Finally: /project-deep-dive ms-teams (real-world application)

[Timeline]
- This week: Focus on identified weak areas
- Next week: Practice with /practice-interview
```

**Best Time:** Start of preparation, mid-way check-in

**Follow-up:** Ask:
- "What should I focus on first?"
- "How long will it take to improve?"
- "Can you drill me on [weak area]?"

---

---

## 🎯 Workflow Examples

### Example 1: Kayhan Space Interview Prep (1 Week Timeline)

**Day 1-2:**
```
/review-kayhan
→ /interview-strategy kayhan-space
→ /weak-areas
```

**Day 3-4:**
```
/tech-topic databases
→ /explain-concept database-indexing
→ /practice-interview kayhan databases
```

**Day 5-6:**
```
/tech-topic system-design
→ /practice-interview kayhan system-design
→ /project-deep-dive geetha-bay
```

**Day 7 (Interview Eve):**
```
/practice-interview kayhan databases (quick)
→ /resume-bullets geetha-bay
→ /review-kayhan
```

---

### Example 2: Learning New Technical Topic

**Week 1:**
```
/weak-areas (identify weak area)
→ /tech-topic [weak-area] (comprehensive learning)
→ /explain-concept [specific-concept] (deep dive)
```

**Week 2:**
```
/practice-interview general [topic]
→ /practice-interview general [topic] (again, build confidence)
→ /project-deep-dive [related-project] (apply to real work)
```

---

### Example 3: Portfolio Discussion Prep

```
/review-projects
→ /project-deep-dive geetha-bay
→ /resume-bullets geetha-bay
→ /project-deep-dive ms-teams
→ /resume-bullets ms-teams
→ /practice-interview general system-design
```

---

## 💡 Pro Tips & Tricks

### Maximize Learning
1. **Start with `/review-*`** - Get overview first
2. **Use `/explain-concept`** - Understand before practicing
3. **Practice `/practice-interview`** - Build muscle memory
4. **Deep dive with `/project-deep-dive`** - Master your work

### Build Confidence
1. Do same `/practice-interview` topic 3 times
2. Reference your projects when answering
3. Track improvements from `/weak-areas`
4. Celebrate progress!

### Before Interview
1. Day before: `/review-kayhan`
2. Morning of: `/practice-interview kayhan databases`
3. 30 min before: Quick `/explain-concept` on uncertain topics
4. Just before: `/resume-bullets` mental rehearsal

### Daily Practice (15-30 mins)
```
Option A (Technical):
/explain-concept [topic]
→ /practice-interview general [topic]

Option B (Project):
/project-deep-dive [project]
→ Ask follow-up questions

Option C (Company):
/practice-interview kayhan [topic]
→ Refine answers
```

---

## 📊 Tracking Progress

### Weekly Checklist

```
□ Completed 1 /tech-topic review
□ Did 2 /practice-interview sessions
□ Did 1 /project-deep-dive
□ Identified weak areas with /weak-areas
□ Improved on 1 previous weak area
□ Created/updated 1 resume bullet
```

### Month Checklist

```
□ Reviewed /kayhan-space prep 2+ times
□ Practiced all database topics
□ Practiced system design
□ Deep dived both projects 2+ times
□ Did 8+ mock interviews
□ Can explain all major concepts
□ Ready for interview ✓
```

---

## 🔗 Command Cross-Reference

| Goal | Command | Related |
|------|---------|---------|
| Understand Kayhan | `/review-kayhan` | `/interview-strategy kayhan-space` |
| Learn topic | `/tech-topic [topic]` | `/explain-concept [concept]` |
| Practice interview | `/practice-interview kayhan [topic]` | `/weak-areas` |
| Explain project | `/project-deep-dive [project]` | `/resume-bullets [project]` |
| Portfolio prep | `/resume-bullets [project]` | `/project-deep-dive [project]` |
| Self-assess | `/weak-areas` | `/tech-topic [weak-area]` |

---

## ✅ Before Interview Checklist

### 1 Week Before
- [ ] `/review-kayhan`
- [ ] `/interview-strategy kayhan-space`
- [ ] `/weak-areas`

### 3 Days Before
- [ ] `/tech-topic databases`
- [ ] `/tech-topic system-design`
- [ ] `/practice-interview kayhan databases`

### 1 Day Before
- [ ] `/practice-interview kayhan system-design`
- [ ] `/project-deep-dive geetha-bay`
- [ ] `/project-deep-dive ms-teams`

### Morning Of
- [ ] `/review-kayhan` (quick)
- [ ] `/practice-interview kayhan databases` (confidence builder)
- [ ] `/resume-bullets geetha-bay` (mental rehearsal)

---

## 🚀 Next Steps

1. **Save this file** in `interview-prep/`
2. **Bookmark key commands**
3. **Start with:** `/review-kayhan`
4. **Then practice:** `/practice-interview kayhan databases`
5. **Track progress:** Use weekly checklist above

---

## 📞 Quick Reference

**Feeling overwhelmed?** → `/review-kayhan` or `/review-projects`

**Need to learn something?** → `/tech-topic [topic]` then `/explain-concept [concept]`

**Want to practice?** → `/practice-interview kayhan [topic]`

**Need confidence?** → `/project-deep-dive [project]`

**Preparing portfolio?** → `/resume-bullets [project]`

---

**Last Updated:** January 29, 2026
**Version:** 1.0

Start your interview prep now! 🚀
