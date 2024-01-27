\documentclass[10pt,letterpaper,sans]{letter}  
\renewcommand{\familydefault}{\sfdefault}
\usepackage[utf8]{inputenc}
\usepackage[empty]{fullpage}
\usepackage[hidelinks]{hyperref}
\usepackage{graphicx}
\usepackage{fontawesome5}
\usepackage{eso-pic}
\usepackage{charter}
\usepackage{avant} 
\usepackage{xcolor}

\addtolength{\topmargin}{-0.5in}
\addtolength{\textheight}{1.0in}
\definecolor{gr}{RGB}{245,245,245}

\newcommand{\myname}{${contact['name']}}
\newcommand{\mytitle}{${contact['title']}}
\newcommand{\myemail}{${contact['email']}}
\newcommand{\mylinkedin}{${contact['linkedin']}} 
\newcommand{\myphone}{${contact['phone']}} 
\newcommand{\mylocation}{${contact['address']}} 

\newcommand{\recipient}{${company['recipient']}} 
\newcommand{\company}{${company['name']}} 
\newcommand{\city}{${company['city']}} 
\newcommand{\jobtitle}{${company['jobtitle']}} 
\newcommand{\shortjobtitle}{${company['shorttitle']}} 
\newcommand{\specificskills}{${company['specificskills']}} 

\newcommand{\greeting}{${letter['greeting']}} 
\newcommand{\closer}{${letter['closer']}} 


\begin{document}

\AddToShipoutPictureBG{
\color{gr}
\AtPageUpperLeft{\rule[-1.8in]{\paperwidth}{1.8in}}
}

\begin{center}
{\fontsize{28}{0}\selectfont\scshape \color{blue} \myname}

{\fontsize{18}{0}\selectfont\scshape \mytitle}

\href{mailto:\myemail}{\color{blue}\faEnvelope\enspace\color{black} \myemail}\hfill
\href{tel:\myphone}{\color{blue}\faPhone\enspace\color{black} \myphone}\hfill
\color{blue}\faMapMarker\enspace\color{black}  \mylocation
\par
\href{https://linkedin.com/in/\mylinkedin}{\color{blue}\faLinkedinIn\enspace\color{black} linkedin.com/in/\mylinkedin}\hfill

\end{center}

\vspace{0.2in}

\begin{flushleft}
\today
\end{flushleft}

\begin{flushleft}
\recipient,\\\
\company \\\
\city
\end{flushleft}

\vspace{-0.1in}

\begin{flushleft}
\greeting,
\end{flushleft}

\begin{center}
\textbf{{\color{blue}\fontsize{16}{0}\selectfont\scshape \jobtitle}}
\end{center}

\vspace{0.25in}\setlength\parindent{24pt}
I am writing to express my strong interest in the \jobtitle \ position at \company. \ With my extensive experience in product management and my passion for driving innovation, I am confident that I would be a valuable asset to your team.
Throughout my career, I have successfully led cross-functional teams and delivered exceptional results.  I have a proven track record of developing and launching successful products that have generated significant revenue growth.  

${body['customparagraph']}

As a Senior Product Manager at Bycast, Inc. I spearheaded the development of a groundbreaking object storage system that revolutionized long-term management and real-time retrieval of large sets of mission-critical data in industries as diverse as medical imaging and broadcasting.  The success of the product let to massive revenue growth and the eventual acquisition by a Forunte-500 company (NetApp).  

What excites me most about the \shortjobtitle \ position at \company \ is the opportunity to apply my extensive knowledge of \specificskills \ to drive the product roadmap and success.  I am confident that my strategic mindset, strong technical and analytical skills, and ability to translate customer insights and regulations into actionable product strategies would enable me to make a significant impact at \company.

I am excited about the opportunity to join your team and contribute to its continued growth and success.  I am confident that my skills and experience make me a strong fit for this role, and I am eager to bring my passion for product management to the table.  Thank you for considering my application.

\vspace{0.1in}

\begin{flushleft}
\closer,

\vspace{-0.1in}\includegraphics[width=1.5in]{signature.png}\vspace{-0.1in}

\myname 

\end{flushleft}

\end{document}
