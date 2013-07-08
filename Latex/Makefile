full: *.tex ../figures/* ../structures/*
	latexmk -f -pdf Thesis.tex

#	pdflatex Thesis.tex
#	pdflatex Thesis.tex
#	pdflatex Thesis.tex
#	bibtex Thesis
#	makeglossaries Thesis
#	pdflatex Thesis.tex

preview:
	latexmk -pdf -pv thesis.tex

clean:
	-rm -f *.aux *.bbl *.blg *.brf *.dvi *.glg *.glo *.gls *.ist *.lof *.log *.los *.lot *.out *.toc *.fls *.fdb_latexmk
	-rm -f Thesis.pdf
