import re


def escape(input_data=''):
    if isinstance(input_data, dict):
        return {k: escape(v) for k, v in input_data.items()}
    elif isinstance(input_data, list):
        return [escape(elt) for elt in input_data]
    elif isinstance(input_data, str):
        # Do the actual escaping here
        input_data = re.sub(r'\[&\]', '&amp;', input_data)         # Ampersands
        input_data = re.sub(r'\[``\]', '&ldquo;', input_data)      # Smart quotes (open)
        input_data = re.sub(r'\[''\]', '&rdquo;', input_data)      # Smart quotes (close)
        input_data = re.sub(r'\[#\]', '#', input_data)             # Number sign
        input_data = re.sub(r'\[\$\]', '$', input_data)            # Dollar sign
        input_data = re.sub(r'\[%\]', '%', input_data)             # Percent sign
        input_data = re.sub(r'\[---\]', '&mdash;', input_data)     # Em dash
        input_data = re.sub(r'\[--\]', '&ndash;', input_data)      # En dash
        input_data = re.sub(r'\[(.*?)\]\((.*?)\)', r'<a href="\2">\1</a>', input_data)    # Link handling
        return input_data
    else:
        return input_data
