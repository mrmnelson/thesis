all: Thesis.pdf

Thesis.pdf: *.tex figures/* structures/*
	pdflatex Thesis.tex

full: *.tex figures/* structures/*
	pdflatex Thesis.tex
	pdflatex Thesis.tex
	pdflatex Thesis.tex
	bibtex Thesis
	makeglossaries Thesis
	pdflatex Thesis.tex

clean:
	-rm -f *.aux *.bbl *.blg *.brf *.dvi *.glg *.glo *.gls *.ist *.lof *.log *.los *.lot *.out *.toc
	-rm -f Thesis.pdf
