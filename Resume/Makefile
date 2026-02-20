TEX = resume.tex
PDF = resume.pdf

.PHONY: build clean open

build: $(PDF)

$(PDF): $(TEX) preamble.tex commands.tex heading/*.tex summary/*.tex experience/*.tex experience/**/*.tex projects/*.tex projects/**/*.tex skills/*.tex education/*.tex
	tectonic $(TEX)

clean:
	rm -f $(PDF)

open: $(PDF)
	open $(PDF)
