# Define the shell used
SHELL = /bin/bash

# Define the paths to python3 and pdflatex
PYTHON = /usr/bin/python3
PDFLATEX = /usr/bin/pdflatex

# Define the output directory
OUTPUT_DIR = output/

# Phony targets for make commands
.PHONY: all clean resume cover resume-html resume-tex resume-txt resume-pdf cover-tex cover-pdf

# Default target
all: cover-tex cover-pdf resume-html resume-tex resume-txt resume-pdf

# Clean the output directory
clean:
	rm -rf $(OUTPUT_DIR)*

# Resume target rules
resume: resume-html resume-tex resume-txt resume-pdf

resume-html: resume.yml templates/html-resume.mako templates/resume.scss
	$(PYTHON) ./generate.py -i resume.yml -t html

resume-tex: resume.yml templates/tex-resume.mako
	$(PYTHON) ./generate.py -i resume.yml -t tex

resume-txt: resume.yml templates/txt-resume.mako
	$(PYTHON) ./generate.py -i resume.yml -t txt

resume-pdf: resume-tex
	$(PDFLATEX) -output-directory=$(OUTPUT_DIR) $(OUTPUT_DIR)resume.tex

# Cover target rules
cover: cover-tex cover-pdf

cover-tex: cover.yml templates/tex-cover.mako
	$(PYTHON) ./generate.py -i cover.yml -t tex

cover-pdf: cover-tex
	$(PDFLATEX) -output-directory=$(OUTPUT_DIR) $(OUTPUT_DIR)cover.tex
	$(PDFLATEX) -output-directory=$(OUTPUT_DIR) $(OUTPUT_DIR)cover.tex
