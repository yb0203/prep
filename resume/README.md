# Resume

LaTeX source for my one-page resume, built with [tectonic](https://tectonic-typesetting.github.io/).

## Directory Structure

Each section lives in its own directory containing a `.tex` file (LaTeX content compiled into the PDF) and one or more `.md` files (interview-prep notes — not part of the PDF).

```
resume.tex                          # main orchestrator — \input's everything else
preamble.tex                        # packages, geometry, fonts
commands.tex                        # custom LaTeX commands
Makefile                            # build / clean / open targets
heading/
  heading.tex
summary/
  summary.tex
  summary.md
experience/
  experience.tex
  experience.md
  centralized-report-server/
    centralized-report-server.tex
    centralized-report-server.md
  ai-models-evaluation/
    ai-models-evaluation.tex
    ai-models-evaluation.md
  perf-automation-framework/
    perf-automation-framework.tex
    perf-automation-framework.md
  finacle-api-automation/
    finacle-api-automation.md
projects/
  projects.tex
  gitabae/
    gitabae.tex
    gitabae.md
  vibe-check/
    vibe-check.tex
    vibe-check.md
skills/
  skills.tex
  programming-languages.md
  tools-frameworks.md
  core-competencies.md
  certifications.md
education/
  education.tex
  education.md
```

## .tex / .md Pairing

Every logical block has a `.tex` file and a companion `.md` file colocated in the same directory.

- `.tex` — the LaTeX source compiled into `resume.pdf`. Edit this to change what appears on the resume.
- `.md` — interview-prep notes for that block: context, key claims with evidence, talking points, and anticipated questions. Not compiled; exists solely as reference material when preparing for interviews.

## Build

Requires [tectonic](https://tectonic-typesetting.github.io/) (`brew install tectonic`).

```sh
make          # compile resume.pdf
make clean    # remove build artifacts
make open     # build and open the PDF
```

Or run tectonic directly:

```sh
tectonic resume.tex
```

## Adding a New Section or Block

**New top-level section** (e.g. `volunteering`):

1. Create `volunteering/volunteering.tex` with the section content.
2. Optionally create `volunteering/volunteering.md` with interview-prep notes.
3. Add `\input{volunteering/volunteering}` to `resume.tex` at the desired position.
4. Add `volunteering/*.tex` to the dependency list in `Makefile`.

**New entry within an existing section** (e.g. a new experience item):

1. Create a subdirectory: `experience/new-role/`.
2. Add `new-role.tex` with the entry content and `\input` it from `experience/experience.tex`.
3. Add a companion `new-role.md` for interview-prep notes.
4. The `Makefile` glob `experience/**/*.tex` picks it up automatically.
