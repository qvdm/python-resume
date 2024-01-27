${contact["name"]}
${contact["title"]}
${contact["address"]}
Email: ${contact["email"]}
Phone: ${contact["phone"]}

${summary}

Accomplishments and Achievements
--------------------------------

% for entry in accomplishments: 
- ${entry['title']}: ${entry['content']}
% endfor

Professional Experience
-----------------------

% for entry in experience: 
<%
  date='' 
  location=''
  if 'date' in entry.keys() : 
    date=entry['date']
  if 'location' in entry.keys() : 
    location=entry['location']
%>

${entry['position']}
${entry['employer']}     ${location}     ${date}

% if 'profile' in entry.keys() : 
${entry['profile']}
% endif

% for resp in entry['responsibilities']:
- ${resp}
% endfor
% endfor

Skills
------
% for entry in skills:
${entry['category']}:
% for skill in entry['list']:
- ${skill}
% endfor
%endfor

Education
---------
% for entry in degrees:
${entry['title']} ${entry['institution']}
% endfor

Certifications
______________
% for entry in certifications:
${entry['title']} ${entry['institution']}
% endfor

