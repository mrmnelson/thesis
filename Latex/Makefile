TEX := $(wildcard *.tex)

Thesis.pdf: $(TEX)
	latex Thesis
	bibtex Thesis
	makeglossaries Thesis
	latex Thesis
	latex Thesis

clean:
	rm -f *.aux Thesis.pdf
