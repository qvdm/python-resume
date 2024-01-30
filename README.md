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
```

should do it

## Quick Start

```
git clone https://github.com/qvdm/python-resume.git

cd python-resume

pip install -r requirements.txt

make install
```

Next, create a new project directory for each job application.  Copy the files below to the new directory:

```
resume.yml
cover.yml
Makefile
```

You will also need to scan a copy pf your signature and save it as *signature.png* in the project directory. 

You can now edit *resume.yml* and *cover.yml*, adding your details, work experience, skills, etc. 

Once the yaml files are filled in, run:

```
make & make tidy
```

This should result in a cover letter in pdf and text format in the current directory, as 
well as a resume in pdf, html and text format.  

The pdf versions of the cover letter and resume are named according to the name you entered in resume.yml


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

*signature.png* is an image of your signature for the cover letter

The *templates* directory contains the mako templates for transforming the
YAML to output.  It also contains the SCCS source for HTML output

The *escape* directory contains the escape sequence filters

All output is writtent to the *output* directory

## Installing

If you run *make install*, the generator and templates are installed in */usr/local*, and subsequently you 
can copy *resume|cover.yml*, *singature.png* and *Makefile* to an individual project directory, customize it there
and then run *make*.  This will create output directly in your project directory.  


## Building a resume - more targets

You can always create a subset of the output.  Run *make resume* or *make resume-html*, etc.




