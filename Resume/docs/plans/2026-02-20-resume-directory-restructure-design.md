# Resume Directory Restructure Design

## Goal

Every logical block in the resume has a `.tex` file (the display output) and a sibling `.md` file (backing context + interview defense). The directory structure reflects this 1:1 pairing.

## Directory Structure

```
Resume/
├── resume.tex
├── preamble.tex
├── commands.tex
├── Makefile
├── .gitignore
├── README.md
│
├── heading/
│   └── heading.tex
│
├── summary/
│   ├── summary.tex
│   └── summary.md
│
├── experience/
│   ├── experience.tex              # orchestrator: section header + \input sub-blocks
│   ├── experience.md               # role overview, timeline, general defense
│   │
│   ├── perf-automation-framework/
│   │   ├── perf-automation-framework.tex
│   │   └── perf-automation-framework.md
│   │
│   ├── centralized-report-server/
│   │   ├── centralized-report-server.tex
│   │   └── centralized-report-server.md
│   │
│   ├── ai-models-evaluation/
│   │   ├── ai-models-evaluation.tex
│   │   └── ai-models-evaluation.md
│   │
│   └── finacle-api-automation/
│       ├── finacle-api-automation.tex
│       └── finacle-api-automation.md
│
├── projects/
│   ├── projects.tex                # orchestrator: section header + \input sub-blocks
│   │
│   ├── gitabae/
│   │   ├── gitabae.tex
│   │   └── gitabae.md
│   │
│   └── vibe-check/
│       ├── vibe-check.tex
│       └── vibe-check.md
│
├── skills/
│   ├── skills.tex
│   ├── programming-languages.md
│   ├── tools-frameworks.md
│   ├── core-competencies.md
│   └── certifications.md
│
└── education/
    ├── education.tex
    └── education.md
```

## Markdown Template

Each `.md` file follows this structure:

```markdown
# [Logical Block Name]

> Corresponding tex: `../path/to/sibling.tex`

## Context
Brief overview of what this is and why it matters. 2-3 sentences.

## Key Claims & Evidence
For each bullet point in the .tex, provide the backing data:

### "[Exact resume bullet text]"
- **What**: What you actually did (concrete details beyond the resume line)
- **Metrics**: Specific numbers, how they were measured, before/after
- **How**: Technical approach, tools, architecture decisions
- **Why**: Business motivation, what problem it solved

## Talking Points
- Key stories to tell (STAR format snippets)
- Strengths this demonstrates
- How to frame this for different audiences (SDE, manager, system design)

## Anticipated Questions
- Q: [Likely interviewer question]
  - A: [Prepared response outline]

## Technical Deep-Dive
Architecture details, trade-offs considered, alternatives rejected.
Only include for blocks with significant technical complexity.
```

Adaptations:
- `skills/*.md`: "Key Claims" becomes "Proficiency Evidence" (projects that used the skill, depth)
- `education/education.md`: context about IIT BHU, mining-to-SDE transition story, relevant coursework
- "Technical Deep-Dive" is optional, only for complex blocks

## Migration Plan

### File movements

| Current | New |
|---|---|
| `sections/heading.tex` | `heading/heading.tex` |
| `sections/summary.tex` | `summary/summary.tex` |
| `sections/experience.tex` | `experience/experience.tex` (refactored into orchestrator) |
| `sections/projects.tex` | `projects/projects.tex` (refactored into orchestrator) |
| `sections/skills.tex` | `skills/skills.tex` |
| `sections/education.tex` | `education/education.tex` |
| `projects/01-centralized-report-server.md` | `experience/centralized-report-server/centralized-report-server.md` |
| `projects/02-ai-models-evaluation.md` | `experience/ai-models-evaluation/ai-models-evaluation.md` |
| `projects/03-finacle-api-automation.md` | `experience/finacle-api-automation/finacle-api-automation.md` |
| `projects/README.md` | Absorbed into `experience/experience.md` |

### Deleted after migration

- `sections/` directory
- `projects/` directory

### resume.tex input path changes

```tex
\input{heading/heading}
\input{summary/summary}
\input{experience/experience}
\input{projects/projects}
\input{skills/skills}
\input{education/education}
```

### experience.tex refactoring

Becomes an orchestrator that `\input`s sub-block `.tex` files:

```tex
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

Each sub-block `.tex` contains only its bullet points.

### projects.tex refactoring

Same orchestrator pattern with `\input` for gitabae and vibe-check sub-blocks.

### New .md files to create (with template scaffolding)

- `summary/summary.md`
- `experience/experience.md`
- `experience/perf-automation-framework/perf-automation-framework.md`
- `projects/gitabae/gitabae.md`
- `projects/vibe-check/vibe-check.md`
- `skills/programming-languages.md`
- `skills/tools-frameworks.md`
- `skills/core-competencies.md`
- `skills/certifications.md`
- `education/education.md`

### Verification

After migration, `make` must produce an identical `resume.pdf`. The restructure is purely organizational; no content changes.
