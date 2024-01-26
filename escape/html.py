import re

LATEX_HTML = '<span style="font-family:cmr10,\'Latin Modern Roman\',serif">L<span style="text-transform: uppercase; font-size: 70%; margin-left: -0.36em; vertical-align: 0.3em; line-height: 0; margin-right: -0.15em">a</span>T<span style="text-transform: uppercase; margin-left: -0.1667em; vertical-align: -0.5ex; line-height: 0; margin-right: -0.125em">e</span>X</span>'

def escape(input_data=''):
    if isinstance(input_data, dict):
        return {k: escape(v) for k, v in input_data.items()}
    elif isinstance(input_data, list):
        return [escape(elt) for elt in input_data]
    elif isinstance(input_data, str):
        # Do the actual escaping here
        input_data = re.sub(r'\[&\]', '&amp;', input_data)         # Ampersands
        input_data = re.sub(r'\[LaTeX\]', LATEX_HTML, input_data)  # LaTeX
        input_data = re.sub(r'\[``\]', '&ldquo;', input_data)      # Smart quotes (open)
        input_data = re.sub(r'\[''\]', '&rdquo;', input_data)      # Smart quotes (close)
        input_data = re.sub(r'\[#\]', '#', input_data)             # Number sign
        input_data = re.sub(r'\[\$\]', '$', input_data)            # Dollar sign
        input_data = re.sub(r'\[%\]', '%', input_data)             # Percent sign
        input_data = re.sub(r'\[---\]', '&mdash;', input_data)     # Em dash
        input_data = re.sub(r'\[--\]', '&ndash;', input_data)      # En dash
        input_data = re.sub(r'\[(.*?)\]\((.*?)\)', r'<a href="\2">\1</a>', input_data)    # Link handling
        input_data = re.sub(r'\[CPP\]', 'C++', input_data)         # C++
        input_data = re.sub(r'\[MH Yee\]', '<span class="name">MH Yee</span>', input_data) # Bold name in pubs
        return input_data
    else:
        return input_data
