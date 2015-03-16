PANDOC = pandoc
INPUT = README.md
OUTPUT = tutorial.pdf
TITLE = -V title=LearnHaskell
AUTHOR = -V author=bitemyapp
FONTSIZE = -V fontsize=12pt
FONTFAMILY = -V fontfamily=sans
MAINFONT= -V mainfont=Georgia
PAGESIZE = -V pagesize=a4paper
GEOMETRY = -V geometry=landscape
VARIABLES = $(GEOMETRY) $(FONTSIZE) $(PAGESIZE) $(TITLE) $(AUTHOR) $(FONTFAMILY) $(MAINFONT)
FLAGS = --normalize --smart --toc --latex-engine=xelatex $(VARIABLES)

pdf: README.md
	$(PANDOC) -s $(INPUT) -o $(OUTPUT) $(FLAGS) --column=80

dialogues: dialogues.md
	$(PANDOC) -s dialogues.md -o dialogues.pdf $(FLAGS) --column=80
