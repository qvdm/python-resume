import re

PP_TEX = '{C\\nolinebreak[4]\\hspace{-.05em}\\raisebox{.3ex}{\\relsize{-1}{\\textbf{++}}}}'

def escape(input_data=''):
    if isinstance(input_data, dict):
        return {k: escape(v) for k, v in input_data.items()}
    elif isinstance(input_data, list):
        return [escape(elt) for elt in input_data]
    elif isinstance(input_data, str):
        # Do the actual escaping here
        input_data = re.sub(r'\[&\]', '\\\\&', input_data)               # Ampersands
        input_data = re.sub(r'\[LaTeX\]', '\\\\LaTeX{}', input_data)     # LaTeX
        input_data = re.sub(r'\[``\]', '``', input_data)                 # Smart quotes (open)
        input_data = re.sub(r'\[''\]', "''", input_data)                 # Smart quotes (close)
        input_data = re.sub(r'\[#\]', '\\\\#', input_data)               # Number sign
        input_data = re.sub(r'\[\$\]', '\\\\$', input_data)              # Dollar sign
        input_data = re.sub(r'\[%\]', '\\\\%', input_data)               # Percent sign
        input_data = re.sub(r'\[---\]', '---', input_data)               # Em dash
        input_data = re.sub(r'\[--\]', '--', input_data)                 # En dash
        input_data = re.sub(r'\[(.*?)\]\((.*?)\)', r'\\href{\2}{\1}', input_data)   # Link handling
        input_data = re.sub(r'\[CPP\]', PP_TEX, input_data)              # C++
        input_data = re.sub(r'\[MH Yee\]', '\\textbf{MH Yee}', input_data) # Bold name in pubs
        return input_data
    else:
        return input_data

