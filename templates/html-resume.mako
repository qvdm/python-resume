<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Resume - ${contact['name']}</title>
  <link rel="stylesheet" href="resume.css">
  <script src="https://kit.fontawesome.com/2194377492.js" crossorigin="anonymous"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;600&display=swap" rel="stylesheet">

</head>

<body>
  <header class="header">
    <h1 class="page-title">${contact['name']}</h1>
    <h1 class="page-subtitle">${contact['title']}</h1>
    <p class=address>${contact['address']}</p><br/>
    <div class="contact-info">
      <span><i class="fas fa-phone"></i> ${contact['phone']}</span>
      <span><i class="fas fa-envelope"></i> <a href="mailto:${contact['email']}">"${contact['email']}</a></span>
      <span><i class="fab fa-linkedin"></i> <a href="https://linkedin.com/in/${contact['linkedin']}">linkedin.com/in/${contact['linkedin']}</a></span>
    </div>
  </header>
  <section class="" summary>
    <p class="justify">${summary}
    </p>
  </section>


  <section class="achievements">
    <h2>Accomplishments and Achievements</h2>
    <ul class="custom-list-1">
% for entry in accomplishments: 
      <li>
        <strong>${entry['title']}:</strong> ${entry['content']}
      </li>
% endfor
    </ul>

  </section>
  <section class="experience">
    <h2>Professional Experience</h2>

    <div class="experience-list">
% for entry in experience: 
<%
  date='' 
  location=''
  if 'date' in entry.keys() : 
    date=entry['date']
  if 'location' in entry.keys() : 
    location=entry['location']
%>



      <div class="experience-entry">
        <div class="company-location">
          <span class="company">${entry['employer']}</span>
          <span class="location">${location}</span>
        </div>
        <div class="position-date">
          <em class="position">${entry['position']}</em>
          <em class="date">${date}</em>
        </div>
% if 'profile' in entry.keys() : 

        <p class="description">${entry['profile']}</p>
% endif
        <ul class="experience-items">
% for resp in entry['responsibilities']:
          <li>${resp}</li>
% endfor
        </ul>
      </div>
% endfor


    </div>

  </section>


  <section class="skills-section">
    <h2>Skills</h2>

    <ul class="skills">
% for entry in skills:
      <li>
        <strong>${entry['category']}</strong>
        <ul class="subskills">
% for skill in entry['list']:
          <li>${skill}</li>

% endfor
        </ul>
      </li>
%endfor
    </ul>

  </section>

  <section class="education">
    <h2>Education</h2>
    <ul class="education-list">
% for entry in degrees:
      <li>
        <strong>${entry['institution']}</strong><br>
        <em>${entry['title']}</em>
      </li>
% endfor
    </ul>
  </section>

  <section class="certifications">
    <h2>Certifications</h2>
    <ul class="certification-list">
% for entry in certifications:
      <li>
        <strong>${entry['institution']}</strong><br/>
        <em>${entry['title']}</em>
      </li>
% endfor     <li>
 
    </ul>
  </section>

</body>

</html>

