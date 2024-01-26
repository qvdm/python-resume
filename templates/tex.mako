\documentclass[10pt,letterpaper]{article}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[margin={2.0cm,1.5cm}]{geometry}
\usepackage{changepage}
\usepackage{libertine}
\usepackage{microtype}
\usepackage{titlesec}
\usepackage{enumitem}
\usepackage{xcolor}
\usepackage{relsize}
\usepackage{hyperref}

\titleformat*{\section}{\Large\bfseries\scshape}
\definecolor{myblue}{rgb}{0.18,0.31,0.65}
\hypersetup{colorlinks=true,urlcolor=myblue}
\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlist{nolistsep}

\makeatletter
\newcommand\HUGE{\@setfontsize\Huge{30}{36}}
\makeatother

\newcommand{\indentleft}{1em}
\newcommand{\indentright}{0em}
\newcommand{\indenthang}{1.5em}
\newcommand{\interlist}{0.5em}
\newcommand{\postsubhead}{-0.7em}
\newcommand{\postsection}{-1em}
\newcommand{\hangingindent}{%
  \leftskip=\indentleft
  \hangindent=\indenthang
}

\begin{document}
\raggedright

  \begin{center}
    {\HUGE\textbf{${contact["name"]}}}

<% site = contact["site"] %>
<% github = contact["github"] %>
<% email = contact["email"] %>
<% phone = contact["phone"] %>
    \href{tel:${phone}}{${phone}}
    \textbullet\
    \href{http://${github}}{${github}}
    \textbullet\
    \href{mailto:${email}}{${email}}
% if address and cell and contact["address"] and contact["cell"] : 
    \\
    \vspace{-0.5ex}
    ${contact["address"]}
    \textbullet\
    ${contact["cell"]}
% endif
% if citizenship and contact["citizenship"] :
    \\
    \textbf{${contact["citizenship"]}}
% endif 
    \hrule
  \end{center}

  \section*{Experience}
    \vspace{\postsubhead}
    \begin{adjustwidth}{\indentleft}{\indentright}
% for entry in work: 
      \textbf{${entry["title"]}}
      \hfill
      \textbf{${entry["location"]}}\\
      \emph{${entry["employer"]}}
      \hfill
      \emph{${entry["date"]}}
% if notes and entry["notes"]:
      \\ ${entry["notes"]} \\
% endif
% if description and entry["description"]: 
      \begin{itemize}
% for item in entry["description"]: 
        \item ${item}
% endfor 
      \end{itemize>
% endif 
% if loop.index != len(work): 
      \vspace{\interlist}

% endif 
% endfor 
    \end{adjustwidth}
    \vspace{\postsection}
    \clearpage%

  \section*{Publications}
    \vspace{\postsubhead}
% for entry in publications: 
      \hangingindent
      ${entry["authors"]} (${entry["date"]}).
      ${entry["title"]},
      \emph{${entry["in"]}}.
% if loop.index != len(publications): 
      \vspace{\interlist}

% endif 
% endfor 
    \vspace{\postsection}

  \section*{Technical Skills}
    \vspace{\postsubhead}
    \begin{adjustwidth}{\indentleft}{\indentright}
      \begin{itemize}
% for entry in skills: 
        \item ${entry}
% endfor 
      \end{itemize}
    \end{adjustwidth}
    \vspace{\postsection}

  \section*{Education}
    \vspace{\postsubhead}
    \begin{adjustwidth}{\indentleft}{\indentright}


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
\end{adjustwidth}

\end{document}
