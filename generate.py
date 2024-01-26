#!/usr/bin/env python3

import argparse
import yaml
import os
from mako.template import Template
from mako import exceptions

    
# Set up command line argument parsing
parser = argparse.ArgumentParser(description="Generate documents using Mako templates.")
parser.add_argument('-i', '--input', default='resume.yml', help='input file')
parser.add_argument('-t', '--template', default='html', help='template for extension')
args = parser.parse_args()

# Check if the resume file exists
if not os.path.exists(args.input):
    raise FileNotFoundError(f"Error: {args.input} is not present in this directory. Use -i or --input to specify another input file.")

# Load the resume YAML file
with open(args.input, 'r') as file:
    resume = yaml.safe_load(file)

# Check if the template file exists
template_file = os.path.join(os.path.dirname(__file__), 'templates', f'{args.template}.mako')
if not os.path.exists(template_file):
    raise FileNotFoundError(f"Error: template for {args.template} does not exist. Use -t or --template to specify another template file.")

input_basename, _ = os.path.splitext(args.input)

output_file = f'{input_basename}.{args.template}'

# Load the Mako template
try: 
    template = Template(filename=template_file)
    result = template.render(**resume)

    # Create 'output' directory if it doesn't exist
    output_dir = "output"
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # Write to output file
    with open(os.path.join(output_dir, output_file), 'w') as file:
        file.write(result)

    print(f"Created {output_file}")
except:
    print("*****")
    print(exceptions.text_error_template().render())


