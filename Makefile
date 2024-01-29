# Define the shell used
SHELL = /bin/bash

# Check for installed script
ifeq ($(wildcard /usr/local/bin/pyresume.py), /usr/local/bin/pyresume.py)
    GENERATE_CMD = /usr/local/bin/pyresume.py
    TEMPLATES_DIR = /usr/local/etc/pyresume/templates/
    ESC_DIR = /usr/local/etc/pyresume/escape/
    OUTPUT_DIR = ./
else
    GENERATE_CMD = ./generate.py
    TEMPLATES_DIR = ./templates/
    ESC_DIR = ./escape/
    OUTPUT_DIR = output/
endif

# Define the paths to python3 and pdflatex
PYTHON = /usr/bin/python3
PDFLATEX = /usr/bin/pdflatex

# Phony targets for make commands
.PHONY: all clean resume cover resume-html resume-tex resume-txt resume-pdf cover-tex cover-pdf rename install

# Default target
all: cover-tex cover-pdf resume-html resume-tex resume-txt resume-pdf rename 

# Install target
install:
	sudo cp generate.py /usr/local/bin/pyresume.py
	sudo chmod a+x /usr/local/bin/pyresume.py
	sudo mkdir -p  ${TEMPLATES_DIR}
	sudo mkdir -p  ${ESC_DIR}
	sudo cp  templates/* /usr/local/etc/pyresume/templates/
	rm -rf ./escape/__pycache__
	sudo cp  escape/* /usr/local/etc/pyresume/escape/
	
	
# Tidy the output directory
tidy:
	rm -f $(OUTPUT_DIR)*.tex
	rm -f $(OUTPUT_DIR)*.aux
	rm -f $(OUTPUT_DIR)*.out
	rm -f $(OUTPUT_DIR)*.log
	 
# Clean the output directory
clean: tidy
	rm -f $(OUTPUT_DIR)*.pdf
	rm -f $(OUTPUT_DIR)*.html
	rm -f $(OUTPUT_DIR)*.txt
	rm -f $(OUTPUT_DIR)*.css
	

# Resume target rules
resume: resume-html resume-tex resume-txt resume-pdf

resume-html: resume.yml $(TEMPLATES_DIR)html-resume.mako $(TEMPLATES_DIR)resume.scss
	$(GENERATE_CMD) -i resume.yml -t html

resume-tex: resume.yml $(TEMPLATES_DIR)tex-resume.mako
	$(GENERATE_CMD) -i resume.yml -t tex

resume-txt: resume.yml $(TEMPLATES_DIR)txt-resume.mako
	$(GENERATE_CMD) -i resume.yml -t txt

# PDF target- sometimes need to run pdflatex twice
resume-pdf: resume-tex
	$(PDFLATEX) -output-directory=$(OUTPUT_DIR) $(OUTPUT_DIR)resume.tex
	$(PDFLATEX) -output-directory=$(OUTPUT_DIR) $(OUTPUT_DIR)resume.tex

# Cover target rules
cover: cover-tex cover-txt cover-pdf singature.png

cover-tex: cover.yml $(TEMPLATES_DIR)tex-cover.mako signature.png
	$(GENERATE_CMD) -i cover.yml -t tex

cover-txt: cover.yml $(TEMPLATES_DIR)txt-cover.mako
	$(GENERATE_CMD) -i cover.yml -t txt

cover-pdf: cover-tex
	$(PDFLATEX) -output-directory=$(OUTPUT_DIR) $(OUTPUT_DIR)cover.tex

pdf: cover-pdf resume-pdf	
	
# Rename resume/cover files
rename:
	@if [ -f "$(OUTPUT_DIR)resume.pdf" ]; then \
		name=$$($(PYTHON) -c "import yaml; print(yaml.safe_load(open('resume.yml'))['contact']['name'].replace(' ', '_'))"); \
		mv "$(OUTPUT_DIR)resume.pdf" "$(OUTPUT_DIR)Resume_$$name.pdf"; \
	fi
	@if [ -f "$(OUTPUT_DIR)cover.pdf" ]; then \
		name=$$($(PYTHON) -c "import yaml; print(yaml.safe_load(open('cover.yml'))['contact']['name'].replace(' ', '_'))"); \
		mv "$(OUTPUT_DIR)cover.pdf" "$(OUTPUT_DIR)Cover_$$name.pdf"; \
	fi
