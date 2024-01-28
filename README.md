# Python Resume Generator

This generator allows you to store your resume and cover letter details in a
YAML file and then generate good looking documents in PDF, HTML and Text
format.  

The data from the YAML file is written to a LaTex document, which is used to
generate the PDF output.  

## Prerequisistes

- Python 3
- pdflatex, via texlive-full

```
sudo apt install texlive-full 

pip install -r requirements.txt
```

should do it


## Project Structure

```
.
├── escape
├── templates
├── output
├── requirements.txt
├── generator.py
├── Makefile
├── resume.yml
├── cover.yml
├── signature.png
└── README.md


```

*generator.py* is the resume generator

*resume|cover.yml* is the YAML source for the resume and cover letter

*signature.pdf* is an image of your signature for the cover letter

The *templates* directory contains the mako templates for transforming the
YAML to output.  It also contains the SCCS source for HTML output

The *escape* directory contains the escape sequence filters

All output is writtent to the *output* directory


## Building a resume

Add your details to *resume.yml* and *cover.yml*

Run *make*

You can also run a subset, like *make resume* or *make resume-html*

Use *make rename* after running *make*, to renamme the output files, using
your name, extracted from the YAML file.

## Renaming the output pdfs to use your name as title

Run *make rename* 

## Installing

Run *make install*

After installation, you can create any directory containing *resume.yml*,
*cover.yml* and *signature.png* and run *make*.  Output will be in the same
directory



