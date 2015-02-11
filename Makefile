PANDOC = pandoc
INPUT = README.md
OUTPUT = tutorial.pdf
TITLE = -V title=LearnHaskell
AUTHOR = -V author=bitemyapp
FONTSIZE = -V fontsize=12pt
FONTFAMILY = -V fontfamily=sans
PAGESIZE = -V pagesize=a4paper
VARIABLES = $(FONTSIZE) $(PAGESIZE) $(TITLE) $(AUTHOR) $(FONTFAMILY)
FLAGS = --normalize --smart --toc $(VARIABLES)

pdf: README.md
	$(PANDOC) -s $(INPUT) -o $(OUTPUT) $(FLAGS) --column=80
