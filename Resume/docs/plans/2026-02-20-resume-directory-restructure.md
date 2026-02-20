# Resume Directory Restructure Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Restructure the resume repo so every logical block has a colocated `.tex` + `.md` pair, where the `.md` provides backing context and interview defense for the `.tex` content.

**Architecture:** Move each section `.tex` out of the flat `sections/` dir into its own folder at the repo root. Split `experience.tex` and `projects.tex` into orchestrator files that `\input` sub-block `.tex` files. Create sibling `.md` files using the standard template. Migrate existing `projects/*.md` content into the new locations.

**Tech Stack:** LaTeX (tectonic), Markdown, Make

---

### Task 1: Create directory skeleton

**Files:**
- Create directories: `heading/`, `summary/`, `experience/`, `experience/perf-automation-framework/`, `experience/centralized-report-server/`, `experience/ai-models-evaluation/`, `experience/finacle-api-automation/`, `projects/gitabae/`, `projects/vibe-check/`, `skills/`, `education/`

**Step 1: Create all directories**

```bash
cd /Users/yashvi/prep/Resume
mkdir -p heading summary experience/perf-automation-framework experience/centralized-report-server experience/ai-models-evaluation experience/finacle-api-automation projects/gitabae projects/vibe-check skills education
```

Note: `projects/` already exists with old content. The `mkdir -p` for sub-dirs won't conflict. Old files will be dealt with in Task 5.

**Step 2: Verify structure**

```bash
find heading summary experience projects skills education -type d | sort
```

Expected output:
```
education
experience
experience/ai-models-evaluation
experience/centralized-report-server
experience/finacle-api-automation
experience/perf-automation-framework
heading
projects
projects/gitabae
projects/vibe-check
skills
summary
```

**Step 3: Commit**

```bash
git add heading/.gitkeep summary/.gitkeep experience/.gitkeep education/.gitkeep skills/.gitkeep
git commit -m "chore: create directory skeleton for restructure"
```

Note: Git doesn't track empty dirs. Either use `.gitkeep` files or skip this commit and let the next tasks create the files that populate these dirs. Prefer skipping this commit and just verifying dirs exist.

---

### Task 2: Move and split experience section

**Files:**
- Read: `sections/experience.tex`
- Create: `experience/experience.tex`
- Create: `experience/perf-automation-framework/perf-automation-framework.tex`
- Create: `experience/centralized-report-server/centralized-report-server.tex`
- Create: `experience/ai-models-evaluation/ai-models-evaluation.tex`

**Step 1: Create `experience/experience.tex` (orchestrator)**

Write this exact content to `experience/experience.tex`:

```tex
%-----------EXPERIENCE-----------
\section{Experience}
\resumeSubHeadingListStart
    \resumeEntryHeading
      {SDE - 1}{Kotak Mahindra Bank Limited}{Aug 2023 -- Present}

      \vspace{4pt}
      \input{experience/perf-automation-framework/perf-automation-framework}
      \input{experience/centralized-report-server/centralized-report-server}
      \input{experience/ai-models-evaluation/ai-models-evaluation}
\resumeSubHeadingListEnd
```

**Step 2: Create `experience/perf-automation-framework/perf-automation-framework.tex`**

```tex
\small{\textbf{Performance \& Automation Framework}}
\resumeItemListStart
  \resumeItem{Built a scalable performance framework for \textbf{HTTP, JDBC, and ISO} protocols to evaluate core microservices.}
  \resumeItem{Implemented \textbf{auth token refresh mechanisms}, preventing mid-load test failures due to expired credentials.}
  \resumeItem{Developed \textbf{Azure DevOps scripts} for distributed load testing, enhancing cross-team infrastructure scalability.}
  \resumeItem{Accelerated adoption via DevPortal and starter repos, reducing onboarding time by \textbf{70\%} for 5+ internal teams.}
\resumeItemListEnd
```

**Step 3: Create `experience/centralized-report-server/centralized-report-server.tex`**

```tex
\small{\textbf{Centralised Report Server}}
\resumeItemListStart
  \resumeItem{Engineered high-performance APIs for automated report stats comparison, reducing manual verification time by \textbf{90\%}.}
  \resumeItem{Optimized server storage via granular \textbf{log control mechanisms}, saving \textbf{90\% space} per report instance.}
  \resumeItem{Architected a responsive dashboard using \textbf{Python and Flask} for real-time visualization and metric tracking.}
\resumeItemListEnd
```

**Step 4: Create `experience/ai-models-evaluation/ai-models-evaluation.tex`**

```tex
\small{\textbf{AI Models Evaluation \& Security}}
\resumeItemListStart
  \resumeItem{Built an LLM evaluation framework to identify \textbf{10+ OWASP security vulnerabilities} in banking use cases.}
  \resumeItem{Integrated compliance guardrails via \textbf{DeepEval} using modular classes to validate critical model outputs.}
  \resumeItem{Mitigated \textbf{120+ bugs} within core API infrastructure, significantly enhancing production system resiliency.}
\resumeItemListEnd
```

**Step 5: Verify the 4 new .tex files exist with correct content**

```bash
wc -l experience/experience.tex experience/perf-automation-framework/perf-automation-framework.tex experience/centralized-report-server/centralized-report-server.tex experience/ai-models-evaluation/ai-models-evaluation.tex
```

**Step 6: Commit**

```bash
git add experience/
git commit -m "refactor: split experience.tex into orchestrator + sub-block files"
```

---

### Task 3: Move and split projects section

**Files:**
- Read: `sections/projects.tex`
- Create: `projects/projects.tex`
- Create: `projects/gitabae/gitabae.tex`
- Create: `projects/vibe-check/vibe-check.tex`

**Step 1: Create `projects/projects.tex` (orchestrator)**

```tex
%-----------PROJECTS-----------
\section{Key Projects}
    \resumeSubHeadingListStart
      \input{projects/gitabae/gitabae}
      \input{projects/vibe-check/vibe-check}
    \resumeSubHeadingListEnd
```

**Step 2: Create `projects/gitabae/gitabae.tex`**

```tex
\resumeEntryHeading
{GitaBae}{AI Wisdom Chatbot}{}
    \resumeItemListStart
      \resumeItem{Developed a RAG chatbot using \textbf{LangChain} and \textbf{Pinecone} for context-aware responses over 40+ sources.}
      \resumeItem{Integrated semantic similarity search and crisis detection guardrails to ensure safe, accurate user interactions.}
    \resumeItemListEnd
```

**Step 3: Create `projects/vibe-check/vibe-check.tex`**

```tex
\resumeEntryHeading
{Vibe Check}{AI-Powered MCP Server}{}
    \resumeItemListStart
      \resumeItem{Built an AI server enabling \textbf{Natural Language Git operations} to abstract CLI complexity for collaborators.}
      \resumeItem{Automated project versioning and commit messages by integrating LLM-based user prompt parsing logic.}
   \resumeItemListEnd
```

**Step 4: Commit**

```bash
git add projects/projects.tex projects/gitabae/ projects/vibe-check/
git commit -m "refactor: split projects.tex into orchestrator + sub-block files"
```

---

### Task 4: Move simple sections (heading, summary, skills, education)

**Files:**
- Move: `sections/heading.tex` -> `heading/heading.tex`
- Move: `sections/summary.tex` -> `summary/summary.tex`
- Move: `sections/skills.tex` -> `skills/skills.tex`
- Move: `sections/education.tex` -> `education/education.tex`

**Step 1: Move files**

```bash
cd /Users/yashvi/prep/Resume
cp sections/heading.tex heading/heading.tex
cp sections/summary.tex summary/summary.tex
cp sections/skills.tex skills/skills.tex
cp sections/education.tex education/education.tex
```

Use `cp` not `mv` so the old `sections/` still works until we update `resume.tex`. We'll delete `sections/` in Task 6.

**Step 2: Verify copies are identical**

```bash
diff sections/heading.tex heading/heading.tex
diff sections/summary.tex summary/summary.tex
diff sections/skills.tex skills/skills.tex
diff sections/education.tex education/education.tex
```

Expected: no output (files identical).

**Step 3: Commit**

```bash
git add heading/ summary/ skills/ education/
git commit -m "refactor: move heading, summary, skills, education into own directories"
```

---

### Task 5: Update resume.tex and Makefile, delete old directories

**Files:**
- Modify: `resume.tex` (lines 17-22)
- Modify: `Makefile` (line 8 — dependency glob)
- Delete: `sections/` directory
- Delete: `projects/README.md`, `projects/01-*.md`, `projects/02-*.md`, `projects/03-*.md`

**Step 1: Update `resume.tex` input paths**

Change lines 17-22 from:
```tex
\input{sections/heading}
\input{sections/summary}
\input{sections/experience}
\input{sections/projects}
\input{sections/skills}
\input{sections/education}
```

To:
```tex
\input{heading/heading}
\input{summary/summary}
\input{experience/experience}
\input{projects/projects}
\input{skills/skills}
\input{education/education}
```

**Step 2: Update Makefile dependency glob**

Change line 8 from:
```make
$(PDF): $(TEX) preamble.tex commands.tex sections/*.tex
```

To:
```make
$(PDF): $(TEX) preamble.tex commands.tex heading/*.tex summary/*.tex experience/*.tex experience/**/*.tex projects/*.tex projects/**/*.tex skills/*.tex education/*.tex
```

**Step 3: Build and verify PDF is identical**

```bash
cd /Users/yashvi/prep/Resume
make clean && make
```

Expected: `tectonic resume.tex` succeeds, `resume.pdf` is generated.

Visually inspect the PDF to confirm it matches the original. If tectonic is not installed, at minimum verify no LaTeX errors in the build output.

**Step 4: Delete old `sections/` directory**

```bash
rm -rf sections/
```

**Step 5: Delete old project markdown files from `projects/`**

```bash
rm projects/README.md projects/01-centralized-report-server.md projects/02-ai-models-evaluation.md projects/03-finacle-api-automation.md
```

**Step 6: Commit**

```bash
git add -A
git commit -m "refactor: update input paths, clean up old sections/ and project markdown files"
```

---

### Task 6: Migrate existing project .md files to new locations

**Files:**
- Create: `experience/centralized-report-server/centralized-report-server.md` (adapted from old `projects/01-centralized-report-server.md`)
- Create: `experience/ai-models-evaluation/ai-models-evaluation.md` (adapted from old `projects/02-ai-models-evaluation.md`)
- Create: `experience/finacle-api-automation/finacle-api-automation.md` (adapted from old `projects/03-finacle-api-automation.md`)

**Step 1: Create `experience/centralized-report-server/centralized-report-server.md`**

Adapt the content from the old file to match the new template. The old file content should be restructured to follow the template format:
- Add the `> Corresponding tex:` reference
- Reorganize "Key Achievements" into "Key Claims & Evidence" mapped to the specific .tex bullet points
- Add "Talking Points" and "Anticipated Questions" sections (can be initially sparse — user will fill in)

Use the content from the old `projects/01-centralized-report-server.md` as the base. Map each .tex bullet to its evidence:

The three .tex bullets for this block are:
1. "Engineered high-performance APIs for automated report stats comparison, reducing manual verification time by 90%."
2. "Optimized server storage via granular log control mechanisms, saving 90% space per report instance."
3. "Architected a responsive dashboard using Python and Flask for real-time visualization and metric tracking."

**Step 2: Create `experience/ai-models-evaluation/ai-models-evaluation.md`**

Same adaptation for AI Models. The three .tex bullets:
1. "Built an LLM evaluation framework to identify 10+ OWASP security vulnerabilities in banking use cases."
2. "Integrated compliance guardrails via DeepEval using modular classes to validate critical model outputs."
3. "Mitigated 120+ bugs within core API infrastructure, significantly enhancing production system resiliency."

**Step 3: Create `experience/finacle-api-automation/finacle-api-automation.md`**

The finacle project has existing content but NO corresponding .tex sub-block in the current resume (it's not listed in experience.tex). Create the .md based on old content anyway — it's valuable context even though there's no .tex sibling yet. Note this in the file.

**Step 4: Commit**

```bash
git add experience/centralized-report-server/centralized-report-server.md experience/ai-models-evaluation/ai-models-evaluation.md experience/finacle-api-automation/finacle-api-automation.md
git commit -m "docs: migrate existing project writeups to new template format"
```

---

### Task 7: Create new .md scaffold files (experience overview + perf framework)

**Files:**
- Create: `experience/experience.md`
- Create: `experience/perf-automation-framework/perf-automation-framework.md`

**Step 1: Create `experience/experience.md`**

This is the role-level overview. Template:

```markdown
# SDE-1 at Kotak Mahindra Bank

> Corresponding tex: `experience.tex`

## Context
Software Development Engineer at Kotak Mahindra Bank Limited since Aug 2023. Working across performance engineering, centralized reporting, and AI/LLM security evaluation.

## Key Claims & Evidence
<!-- Role-level claims: overall impact, scope of work, team leadership -->

### Role Overview
- **What**: [Fill in: what does your day-to-day look like?]
- **Scope**: [Fill in: how many teams, systems, stakeholders?]
- **Growth**: [Fill in: how has your role evolved since Aug 2023?]

## Talking Points
- Why banking after mining engineering at IIT BHU
- Breadth of work: performance, full-stack, AI/ML security
- [Add more]

## Anticipated Questions
- Q: Why did you choose banking/fintech?
  - A: [Fill in]
- Q: What's your biggest impact at Kotak?
  - A: [Fill in]
- Q: How do you prioritize across multiple projects?
  - A: [Fill in]
```

**Step 2: Create `experience/perf-automation-framework/perf-automation-framework.md`**

```markdown
# Performance & Automation Framework

> Corresponding tex: `perf-automation-framework.tex`

## Context
Built a scalable performance testing framework supporting HTTP, JDBC, and ISO protocols to evaluate core banking microservices at Kotak Mahindra Bank.

## Key Claims & Evidence

### "Built a scalable performance framework for HTTP, JDBC, and ISO protocols to evaluate core microservices."
- **What**: [Fill in: what protocols, what microservices, what scale?]
- **Metrics**: [Fill in: requests/sec, latency improvements, services covered]
- **How**: [Fill in: JMeter? Gatling? Custom? Architecture decisions]
- **Why**: [Fill in: what was failing before? what triggered this need?]

### "Implemented auth token refresh mechanisms, preventing mid-load test failures due to expired credentials."
- **What**: [Fill in: what auth system? OAuth2? JWT? How did tokens expire?]
- **Metrics**: [Fill in: how many test runs were failing before? What % improvement?]
- **How**: [Fill in: token refresh logic, retry mechanisms, thread safety]
- **Why**: [Fill in: load tests were failing mid-run, wasting hours of execution]

### "Developed Azure DevOps scripts for distributed load testing, enhancing cross-team infrastructure scalability."
- **What**: [Fill in: ADO pipelines? YAML? Shell scripts? What distribution model?]
- **Metrics**: [Fill in: how many agents, concurrent users, teams served]
- **How**: [Fill in: pipeline design, agent provisioning, parameterization]
- **Why**: [Fill in: teams couldn't run load tests at scale without shared infra]

### "Accelerated adoption via DevPortal and starter repos, reducing onboarding time by 70% for 5+ internal teams."
- **What**: [Fill in: what is DevPortal? What were the starter repos?]
- **Metrics**: 70% reduction in onboarding time, 5+ teams adopted
- **How**: [Fill in: documentation, templates, example configs]
- **Why**: [Fill in: teams were spending weeks setting up perf testing from scratch]

## Talking Points
- [Fill in: STAR stories for system design interviews]
- [Fill in: how to frame for "tell me about a technical challenge"]

## Anticipated Questions
- Q: How did you decide on the protocol support (HTTP vs JDBC vs ISO)?
  - A: [Fill in]
- Q: How did you handle distributed load generation?
  - A: [Fill in]
- Q: What was the hardest part of getting teams to adopt the framework?
  - A: [Fill in]

## Technical Deep-Dive
[Fill in: architecture diagram description, tech stack, key design decisions]
```

**Step 3: Commit**

```bash
git add experience/experience.md experience/perf-automation-framework/perf-automation-framework.md
git commit -m "docs: add experience overview and perf framework scaffold markdown"
```

---

### Task 8: Create new .md scaffold files (projects)

**Files:**
- Create: `projects/gitabae/gitabae.md`
- Create: `projects/vibe-check/vibe-check.md`

**Step 1: Create `projects/gitabae/gitabae.md`**

```markdown
# GitaBae — AI Wisdom Chatbot

> Corresponding tex: `gitabae.tex`

## Context
A RAG-based chatbot that provides wisdom and guidance from the Bhagavad Gita and related sources, using LangChain and Pinecone for semantic retrieval.

## Key Claims & Evidence

### "Developed a RAG chatbot using LangChain and Pinecone for context-aware responses over 40+ sources."
- **What**: [Fill in: what sources? Books, chapters, commentaries?]
- **Metrics**: 40+ sources indexed, [Fill in: response quality metrics?]
- **How**: [Fill in: embedding model, chunk strategy, Pinecone index config]
- **Why**: [Fill in: what inspired this project? What problem does it solve?]

### "Integrated semantic similarity search and crisis detection guardrails to ensure safe, accurate user interactions."
- **What**: [Fill in: what does crisis detection do? Self-harm keywords? Escalation?]
- **Metrics**: [Fill in: false positive rate? Detection accuracy?]
- **How**: [Fill in: guardrail implementation, threshold tuning]
- **Why**: [Fill in: users seeking spiritual guidance may be in vulnerable states]

## Talking Points
- Personal project showing initiative beyond work responsibilities
- RAG architecture understanding (embeddings, chunking, retrieval)
- Responsible AI: crisis detection guardrails
- [Add more]

## Anticipated Questions
- Q: Why did you choose Pinecone over other vector databases?
  - A: [Fill in]
- Q: How do you handle hallucinations in spiritual/wisdom content?
  - A: [Fill in]
- Q: What's your chunking strategy for religious texts?
  - A: [Fill in]

## Technical Deep-Dive
[Fill in: RAG pipeline architecture, embedding model choice, Pinecone config, LangChain chain design]
```

**Step 2: Create `projects/vibe-check/vibe-check.md`**

```markdown
# Vibe Check — AI-Powered MCP Server

> Corresponding tex: `vibe-check.tex`

## Context
An AI-powered MCP (Model Context Protocol) server that enables natural language Git operations, abstracting CLI complexity for team collaborators.

## Key Claims & Evidence

### "Built an AI server enabling Natural Language Git operations to abstract CLI complexity for collaborators."
- **What**: [Fill in: what Git operations? commit, push, branch, merge?]
- **Metrics**: [Fill in: time saved, adoption numbers?]
- **How**: [Fill in: MCP protocol, LLM integration, command translation]
- **Why**: [Fill in: team members struggling with Git CLI]

### "Automated project versioning and commit messages by integrating LLM-based user prompt parsing logic."
- **What**: [Fill in: semantic versioning? Conventional commits? How does it parse?]
- **Metrics**: [Fill in: commit message quality improvement?]
- **How**: [Fill in: prompt engineering, parsing pipeline]
- **Why**: [Fill in: inconsistent commit messages, manual version bumps]

## Talking Points
- Shows understanding of MCP (emerging standard)
- Developer tooling / DX focus
- LLM integration in practical developer workflows
- [Add more]

## Anticipated Questions
- Q: What is MCP and why did you choose it?
  - A: [Fill in]
- Q: How do you handle ambiguous natural language commands?
  - A: [Fill in]
- Q: What safety measures prevent destructive Git operations?
  - A: [Fill in]

## Technical Deep-Dive
[Fill in: MCP server architecture, LLM integration, command safety layer]
```

**Step 3: Commit**

```bash
git add projects/gitabae/gitabae.md projects/vibe-check/vibe-check.md
git commit -m "docs: add gitabae and vibe-check scaffold markdown"
```

---

### Task 9: Create new .md scaffold files (summary, skills, education)

**Files:**
- Create: `summary/summary.md`
- Create: `skills/programming-languages.md`
- Create: `skills/tools-frameworks.md`
- Create: `skills/core-competencies.md`
- Create: `skills/certifications.md`
- Create: `education/education.md`

**Step 1: Create `summary/summary.md`**

```markdown
# Summary

> Corresponding tex: `summary.tex`

## Context
The opening statement of the resume. Must be defensible in every claim.

## Key Claims & Evidence

### "Software Engineer with 2+ years of experience building scalable banking solutions via Java and Python."
- **What**: [Fill in: started Aug 2023, so ~2.5 years by mid-2026]
- **Metrics**: [Fill in: number of systems built, scale of banking solutions]
- **Evidence**: Experience section projects (perf framework, report server, AI eval)

### "Expert in performance automation, AI/LLM evaluation, and distributed services."
- **What**: [Fill in: what makes you "expert" level? Depth of work in each area]
- **Evidence**: Perf framework (protocols, distributed load), AI eval (OWASP, DeepEval), report server (distributed architecture)

### "Proven track record in optimizing CI/CD workflows and high-impact banking products while ensuring AI security and guardrails."
- **What**: [Fill in: which CI/CD workflows? Which banking products? Which guardrails?]
- **Evidence**: ADO scripts, DevPortal, DeepEval compliance guardrails

## Talking Points
- This summary is the "elevator pitch" — practice delivering it in 30 seconds
- Be ready to back up "expert" and "proven track record" with specifics

## Anticipated Questions
- Q: What do you mean by "scalable banking solutions"?
  - A: [Fill in]
- Q: Can you give an example of an AI guardrail you implemented?
  - A: [Fill in]
```

**Step 2: Create `skills/programming-languages.md`**

```markdown
# Programming Languages

> Corresponding tex: `skills.tex` (line: Programming Languages)

## Proficiency Evidence

### Java
- **Depth**: [Fill in: primary language at work?]
- **Used in**: Finacle API automation framework, performance framework
- **Comfort level**: [Fill in: can you do system design in Java? Concurrency? Streams?]

### Python
- **Depth**: [Fill in: Flask apps, scripting, AI/ML work]
- **Used in**: Report server, AI evaluation framework, GitaBae
- **Comfort level**: [Fill in]

### C++
- **Depth**: [Fill in: academic? Competitive programming? Any work usage?]
- **Used in**: [Fill in]

### SQL
- **Depth**: [Fill in: complex queries? Optimization? Which databases?]
- **Used in**: [Fill in]

### C
- **Depth**: [Fill in]
- **Used in**: [Fill in]

### JavaScript
- **Depth**: [Fill in: frontend? Node.js? React?]
- **Used in**: [Fill in]

## Anticipated Questions
- Q: Which is your strongest language?
  - A: [Fill in]
- Q: Rate yourself 1-10 in [language]
  - A: [Fill in: be honest, interviewers probe]
```

**Step 3: Create `skills/tools-frameworks.md`**

```markdown
# Tools & Frameworks

> Corresponding tex: `skills.tex` (line: Tools & Frameworks)

## Proficiency Evidence

### Azure DevOps (ADO)
- **Used in**: Performance framework (distributed load testing pipelines)
- **Depth**: [Fill in: YAML pipelines? Boards? Repos? Artifacts?]

### Flask
- **Used in**: Centralized report server
- **Depth**: [Fill in: REST APIs, templating, deployment?]

### LangChain
- **Used in**: GitaBae RAG chatbot
- **Depth**: [Fill in: chains, agents, retrievers?]

### JUnit
- **Used in**: [Fill in]
- **Depth**: [Fill in]

### Maven
- **Used in**: [Fill in]
- **Depth**: [Fill in]

### Git
- **Used in**: All projects, Vibe Check MCP server
- **Depth**: [Fill in: branching strategies, rebasing, hooks?]

### MongoDB
- **Used in**: [Fill in]
- **Depth**: [Fill in]

### DeepEval
- **Used in**: AI Models Evaluation framework
- **Depth**: [Fill in: custom metrics, modular evaluation classes]

### Ollama
- **Used in**: [Fill in]
- **Depth**: [Fill in: local LLM hosting, model management]

## Anticipated Questions
- Q: Why Flask over Django/FastAPI?
  - A: [Fill in]
- Q: How deep is your LangChain experience?
  - A: [Fill in]
```

**Step 4: Create `skills/core-competencies.md`**

```markdown
# Core Competencies

> Corresponding tex: `skills.tex` (line: Core Competencies)

## Proficiency Evidence

### Performance Engineering
- **Evidence**: Built multi-protocol perf framework, distributed load testing
- **Depth**: [Fill in: what metrics do you track? How do you identify bottlenecks?]

### Distributed Systems
- **Evidence**: [Fill in: which systems? What distribution model?]
- **Depth**: [Fill in: CAP theorem understanding? Consistency models?]

### RAG
- **Evidence**: GitaBae chatbot (LangChain + Pinecone)
- **Depth**: [Fill in: chunking, embedding, retrieval strategies]

### AI Guardrails
- **Evidence**: DeepEval framework, crisis detection in GitaBae
- **Depth**: [Fill in: what types of guardrails? How do you test them?]

### OOPS
- **Evidence**: Modular framework designs across all projects
- **Depth**: [Fill in: SOLID principles, design patterns used]

### DSA
- **Depth**: [Fill in: competitive programming background? LeetCode stats?]
- **Comfort level**: [Fill in: can you solve mediums confidently? Hards?]

### Agile
- **Evidence**: [Fill in: sprint-based work at Kotak? Scrum? Kanban?]
- **Depth**: [Fill in]

## Anticipated Questions
- Q: Explain a distributed system you've built
  - A: [Fill in]
- Q: How do you approach performance testing?
  - A: [Fill in]
```

**Step 5: Create `skills/certifications.md`**

```markdown
# Certifications

> Corresponding tex: `skills.tex` (line: Certifications)

## Proficiency Evidence

### Design Thinking
- **Issuer**: [Fill in]
- **What you learned**: [Fill in]
- **How you've applied it**: [Fill in]

### SOLID Principles
- **Issuer**: [Fill in]
- **What you learned**: [Fill in]
- **How you've applied it**: [Fill in: specific examples in your projects]

### Hugging Face - Agents Course
- **Issuer**: Hugging Face
- **What you learned**: [Fill in: agents, tool use, function calling?]
- **How you've applied it**: [Fill in: AI eval framework? GitaBae? Vibe Check?]

## Anticipated Questions
- Q: What did you learn from the Hugging Face Agents course?
  - A: [Fill in]
- Q: How do you apply SOLID principles in your daily work?
  - A: [Fill in]
```

**Step 6: Create `education/education.md`**

```markdown
# Education

> Corresponding tex: `education.tex`

## Context
B.Tech in Mining Engineering from IIT (BHU), Varanasi. The mining-to-software transition is a common interview talking point.

## Key Claims & Evidence

### "B.Tech (Mining Engineering), IIT (BHU), Varanasi — 8.39/10 — 2023"
- **What**: 4-year undergraduate degree at one of India's top engineering institutes
- **Relevance to SDE**: [Fill in: CS courses taken? Programming clubs? Projects?]
- **CGPA context**: [Fill in: department rank? How competitive?]

### "CBSE Class XII — 94.20% — 2018"
- **Context**: [Fill in]

### "CBSE Class X — 95.00% — 2016"
- **Context**: [Fill in]

## Talking Points
- The mining-to-SDE story: what triggered the switch, when, how
- IIT BHU brand recognition and rigor
- Self-taught programming or CS minor/electives?
- [Fill in: hackathons, coding clubs, relevant extracurriculars]

## Anticipated Questions
- Q: Why mining engineering if you wanted to be a software engineer?
  - A: [Fill in: this WILL be asked — have a crisp, authentic answer]
- Q: What CS-related things did you do at IIT BHU?
  - A: [Fill in]
- Q: How did you prepare for the SDE role transition?
  - A: [Fill in]
```

**Step 7: Commit**

```bash
git add summary/summary.md skills/ education/education.md
git commit -m "docs: add summary, skills, and education scaffold markdown"
```

---

### Task 10: Update README.md and final verification

**Files:**
- Modify: `README.md`

**Step 1: Update README.md to document the new structure**

Replace the directory structure section and any references to `sections/` or `projects/` with the new structure. The README should document:
- The new directory layout
- The `.tex` + `.md` pairing concept
- Build instructions (unchanged: `make` / `tectonic resume.tex`)
- How to add a new section or logical block

**Step 2: Build final PDF**

```bash
cd /Users/yashvi/prep/Resume
make clean && make
```

Verify the PDF compiles without errors and looks identical to the original.

**Step 3: Commit**

```bash
git add README.md
git commit -m "docs: update README for new directory structure"
```

---

## Task Summary

| Task | Description | Files touched |
|------|-------------|---------------|
| 1 | Create directory skeleton | directories only |
| 2 | Split experience.tex | 4 new .tex files |
| 3 | Split projects.tex | 3 new .tex files |
| 4 | Move simple sections | 4 .tex files copied |
| 5 | Update resume.tex + Makefile, delete old dirs | resume.tex, Makefile, sections/, projects/*.md |
| 6 | Migrate existing .md files | 3 .md files adapted |
| 7 | Scaffold experience .md files | 2 new .md files |
| 8 | Scaffold project .md files | 2 new .md files |
| 9 | Scaffold summary, skills, education .md files | 6 new .md files |
| 10 | Update README, final verification | README.md |
