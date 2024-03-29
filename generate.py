#!/usr/bin/env python3 

import argparse
import yaml
import os
import sys
import importlib.util
from mako.template import Template
from mako import exceptions
import sass


# Set up command line argument parsing
parser = argparse.ArgumentParser(description="Generate documents using Mako templates.")
parser.add_argument('-i', '--input', default='resume.yml', help='input file')
parser.add_argument('-t', '--template', default='tex', help='template for extension')
args = parser.parse_args()

# Check if the input file exists
if not os.path.exists(args.input):
    raise FileNotFoundError(f"Error: {args.input} is not present in this directory. Use -i or --input to specify another input file.")

# Load the input YAML file
with open(args.input, 'r') as file:
    input = yaml.safe_load(file)
    
# Get the type (resume|cover)
type=input['type']

# Determine if we are local or installed
mypath = os.path.dirname(__file__)
installed = mypath.startswith("/usr/local/bin")


# Construct the escape and template definition file paths
if installed :
    escape_defn = os.path.join('/usr/local/etc/pyresume', 'escape', f"{args.template}.py")
    template_dir=os.path.join('/usr/local/etc/pyresume', 'templates')
    template_file = os.path.join(template_dir, f'{args.template}-{type}.mako')
else:
    escape_defn = os.path.join(os.path.dirname(__file__), 'escape', f"{args.template}.py")
    template_dir = os.path.join(os.path.dirname(__file__), 'templates')
    template_file = os.path.join(template_dir, f'{args.template}-{type}.mako')


# Check if the escape definition file exists and import it if it does
if os.path.exists(escape_defn):
    spec = importlib.util.spec_from_file_location("escape_module", escape_defn)
    escape_module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(escape_module)

    # Check if 'escape' function is defined in the imported module and call it
    if hasattr(escape_module, 'escape'):
        input = escape_module.escape(input)

# Check if the template file exists
if not os.path.exists(template_file):
    raise FileNotFoundError(f"Error: template for {args.template} does not exist. Use -t or --template to specify another template file.")
    exit()

input_basename, _ = os.path.splitext(args.input)

output_file = f'{input_basename}.{args.template}'

# Create 'output' directory if it doesn't exist
if installed :
    output_dir = "."
else:
    output_dir = "output"
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

# Load the Mako template
try: 
    template = Template(filename=template_file)
    result = template.render(**input)


    # Write to output file
    with open(os.path.join(output_dir, output_file), 'w') as file:
        file.write(result)
        
        
    print(f"Created {output_file}")
except:
    print(exceptions.text_error_template().render())



if args.template == 'html' : 
  sass.compile(dirname=(template_dir, output_dir), output_style='compressed')
  print(f"Created css")
  

