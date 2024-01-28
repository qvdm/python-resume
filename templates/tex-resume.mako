<% 
  name = contact["name"]
  fl = name.split(' ', 1)
  first, last = fl

%>
<% email = contact["email"] %>
<% phone = contact["phone"] %>
<% title = contact["title"] %>
<% address = contact["address"] %>

\documentclass[12pt,letterpaper,sans]{moderncv}
\moderncvstyle[norules]{banking}
\moderncvcolor{blue}
\usepackage[utf8]{inputenc}
\usepackage[empty]{fullpage}
\usepackage[scale=0.85]{geometry}
\usepackage{import}
\usepackage{textcomp}
\usepackage{graphicx}
\usepackage{fontawesome5}
\usepackage{eso-pic}
\usepackage{charter}
\usepackage{avant} 
\usepackage{xcolor}

\renewcommand*{\titlefont}{\fontsize{22}{80}\mdseries\upshape}
\setlength{\footskip}{14.5pt}


\makeatletter
\@initializecommand{\makehead}{
  \setlength{\makeheaddetailswidth}{0.8\textwidth}
  \hfil
  \parbox{\makeheaddetailswidth}{
    \centering
    \namestyle{\@firstname~\@lastname}\linebreak
    \vskip-0.5ex
    \ifthenelse{\equal{\@title}{}}{}{\titlestyle{\@title}}\linebreak
    \if@details{
      \\
      \addressfont\color{color2}
      \ifthenelse{\isundefined{\@addressstreet}}{}{\addtomakeheaddetails{\addresssymbol\@addressstreet}
        \ifthenelse{\equal{\@addresscity}{}}{}{\addtomakeheaddetails[~--~]{\@addresscity}}
        \ifthenelse{\equal{\@addresscountry}{}}{}{\addtomakeheaddetails[~--~]{\@addresscountry}}
        \flushmakeheaddetails\@firstmakeheaddetailselementtrue\\}
      \collectionloop{phones}{
        \addtomakeheaddetails{\csname\collectionloopkey phonesymbol\endcsname\collectionloopitem}}
      \ifthenelse{\isundefined{\@email}}{}{\addtomakeheaddetails{\emailsymbol\emaillink{\@email}}}
      \ifthenelse{\isundefined{\@homepage}}{}		{\addtomakeheaddetails{\homepagesymbol\httpslink{\@homepage}}}
      \collectionloop{socials}{
        \addtomakeheaddetails{\csname\collectionloopkey socialsymbol\endcsname\collectionloopitem}}
      \ifthenelse{\isundefined{\@extrainfo}}{}{\addtomakeheaddetails{\@extrainfo}}
      \flushmakeheaddetails}\fi}\\[2.5em]}
\par      

\makeatother

\name{${first}}{${last}}
\email{${email}}
\phone[mobile]{${phone}}
\title{${title}}
\address{${address}}{}{}

\begin{document}

\makecvtitle

\small{${summary}}


\section{Accomplishments and Achievements}
\vspace{6pt}
\begin{itemize}
% for entry in accomplishments: 
\vspace{6pt}
\item \textbf{${entry['title']}:} ${entry['content']}
% endfor
\end{itemize}

\vspace{24pt}

\section{Professional Experience}
\vspace{6pt}
\begin{itemize}
% for entry in experience: 
<%
  date='' 
  location=''
  if 'date' in entry.keys() : 
    date=entry['date']
  if 'location' in entry.keys() : 
    location=entry['location']
%>

\item{\cventry{${date}}{${entry['position']}}{${entry['employer']}}{${location}}{}{}}
% if 'profile' in entry.keys() : 
${entry['profile']}
% endif
\par
\begin{itemize}
% for resp in entry['responsibilities']:
\vspace{6pt}
\item ${resp}
\par
% endfor
\end{itemize}
\vspace{24pt}
% endfor
\end{itemize}


\section{Skills}
\vspace{6pt}
\begin{itemize}
% for entry in skills:
\item \textbf{${entry['category']}}
\begin{itemize}
% for skill in entry['list']:
\item ${skill}
% endfor
\end{itemize}
%endfor
\end{itemize}

\section{Education}
\vspace{5pt}
\begin{itemize}
% for entry in degrees:
\item{\cventry{}{${entry['title']}}{${entry['institution']}}{}{}{}}
% endfor
\end{itemize}

\section{Certifications}
\vspace{5pt}
\begin{itemize}
% for entry in certifications:
\item{\cventry{}{${entry['title']}}{${entry['institution']}}{}{}{}}
% endfor
\end{itemize}



\end{document}


