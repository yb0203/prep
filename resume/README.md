# Resume

LaTeX source for my one-page resume, built with [tectonic](https://tectonic-typesetting.github.io/).

## Directory Structure

```
resume.tex          # main orchestrator — \input's everything else
preamble.tex        # packages, geometry, fonts
commands.tex        # custom LaTeX commands
sections/           # content sections
  heading.tex
  summary.tex
  experience.tex
  projects.tex
  skills.tex
  education.tex
projects/           # interview-prep project write-ups (not part of the PDF)
Makefile            # build / clean / open targets
```

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

## Editing

Each section lives in its own file under `sections/`. Edit the relevant file and rebuild.

`preamble.tex` controls page layout, fonts, and packages.
`commands.tex` defines reusable LaTeX commands shared across sections.

## Projects Portfolio

See [projects/README.md](projects/README.md) for detailed interview-prep write-ups of key projects.
