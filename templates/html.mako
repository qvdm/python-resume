<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>
      ${contact["name"]}
    </title>
    <!-- Styles and other head elements remain the same -->
  </head>

  <body id="resume">
    <div id="container">
      <h1>${contact["name"]}</h1>
<% site = contact["site"] %>
<% github = contact["github"] %>
<% email = contact["email"] %>
      <div class="contact">
        <span class="digital">
          <a href="http://${site}">${site}</a>
          &bull;
          <a href="http://${github}">${github}</a>
          &bull;
          <a href="mailto:${email}">${email}</a>
        </span>
% if contact["address"] and contact["cell"]:
        <br>
        <span class="physical">
          ${contact["address"]}
          &bull;
          ${contact["cell"]}
        </span>
% endif
      </div><!-- div.contact -->
% if contact["citizenship"]:
      <div class="citizenship">
        ${contact["citizenship"]}
      </div><!-- div.citizenship -->
% endif
      <div class="underline"></div>

      <h2>Experience</h2>
      <div class="subsection">
% for entry in work:
        <h3>
          <span class="title">${entry["title"]}</span>
          <span class="location">${entry["location"]}</span>
        </h3>
        <div class="h3sub">
          <span class="employer">${entry["employer"]}</span>
          <span class="date">${entry["date"]}</span>
        </div>
% if entry["description"]:
        <ul>
% for item in entry["description"]:
          <li>
            ${item}
          </li>
% endfor
        </ul>
% else:
        <div class="h3nolist"></div>
% endif
% endfor
      </div><!-- div.subsection -->
      <div class="pagebreak"></div>

      <h2>Publications</h2>
      <div class="subsection">
% for entry in publications:
        <p class="publication">
          ${entry["authors"]} (<span class="date">${entry["date"]}</span>).
          <span class="title">${entry["title"]}</span>,
          <span class="in">${entry["in"]}</span>.
        </p>
% endfor
      </div><!-- div.subsection -->

      <h2>Technical Skills</h2>
      <div class="subsection">
        <ul>
% for entry in skills:
          <li>
            ${entry}
          </li>
% endfor
        </ul>
      </div><!-- div.subsection -->

      <h2>Education</h2>
      <div class="subsection h3spacing">
% for entry in education:
        <h3>
          <span class="level">${entry["level"]}</span>
          <span class="location">${entry["location"]}</span>
        </h3>
        <div class="h3sub">
          <span class="institution">${entry["institution"]}</span>
          <span class="date">${entry["date"]}</span>
        </div>
% if entry["notes"]:
        <ul>
% for item in entry["notes"]:
          <li>
            ${item}
          </li>
% endfor
        </ul>
% endif
% endfor
      </div><!-- div.subsection -->

    </div><!-- div.container -->
  </body>
</html>
