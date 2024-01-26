${contact["name"].upper() + "\n"}

http://${contact["site"]} * http://${contact["github"]} * ${contact["email"]}
% if contact["address"] and contact["cell"]:
${contact["address"]} * ${contact["cell"] + "\n"}
% endif
% if contact["citizenship"]:
${"**" + contact["citizenship"] + "**\n"}
% endif
--------------------------------------------------------------------------------

<%
import textwrap

def wrap(text):
    text = text.replace("](", "] (")
    return textwrap.fill(text, width=74, subsequent_indent='      ').strip()
%>

EXPERIENCE

% for entry in work:
  ${entry["title"]}
  ${entry["employer"]}, ${entry["location"]}
  ${entry["date"]}
% if entry["description"]:
% for item in entry["description"]:

    - ${wrap(item)}
% endfor

% endif
% endfor

PUBLICATIONS
% for entry in publications:
% authors = entry["authors"]
% date = entry["date"]
% title = entry["title"]
% published_in = entry["in"]
% entry_text = f"{authors} ({date}). {title}, {published_in}."

  ${wrap(entry_text)}
% endfor


TECHNICAL SKILLS
% for entry in skills:

    - ${wrap(entry)}
% endfor


EDUCATION
% for entry in education:

  ${entry["level"]}
  ${entry["institution"]}, ${entry["location"]}
  ${entry["date"]}
% if entry["notes"]:
% for item in entry["notes"]:
      ${item}
% endfor
% endif
% endfor
