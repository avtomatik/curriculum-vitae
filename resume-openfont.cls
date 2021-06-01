% Intro Options
\ProvidesClass{resume-openfont}[2021/05/30 Abdullah's version]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{ 
    \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

%------------------------------------------------------
% Package Imports
% Set boundaries
\RequirePackage[hmargin=1cm, vmargin=0.94cm]{geometry}
% remove ugly boxes around links
\RequirePackage[hidelinks]{hyperref}
% setup custom titles
\RequirePackage{titlesec}
\RequirePackage{textcomp}
% For skills table
\RequirePackage{enumitem}
% page setup 
\RequirePackage{fancyhdr}
\RequirePackage[english]{babel}
% Using tables like the profile section
\RequirePackage{tabularx}
% Used for the link symbol
\RequirePackage{fontawesome}
% Set up font 
\RequirePackage{local-font}

%------------------------------------------------------
% Reformatting default sections
% section
\titlespacing{\section}{0pt}{0pt}{0pt}
\titleformat{\section}{
    \color{headings}
    \scshape
    \customMedium
    \fontsize{16pt}{20pt}
    \selectfont 
    \raggedright
    \uppercase
} {}{0em}{}
% subsection
\titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
\titleformat{\subsection}{
    \color{subheadings}
    \customMedium
    \fontsize{12pt}{12pt}
    \selectfont
    \bfseries
    \uppercase
    \normalfont % clear out any loaded font setting
} {}{0em}{}


%------------------------------------------------------
% Subheadings command
\newcommand{\runsubsection}[1]{
    \color{subheadings}
    \customMedium
    \fontsize{12pt}{12pt}
    \selectfont
    \bfseries
    \uppercase
    {#1} 
    \normalfont
}

% Descriptors command
\newcommand{\descript}[1]{
    \color{subheadings}
    \raggedright
    \scshape
    \customMedium
    \fontsize{11pt}{13pt}
    \selectfont{#1} 
    \normalfont
}

% Location command
\newcommand{\location}[1]{
    \color{headings}
    \raggedright
    \customMedium
    \fontsize{11pt}{13pt}
    \selectfont{#1}
    \normalfont
}

% minor sections - like even smaller sub section
\newcommand{\minorSection}[1]{
    \color{subheadings}
    \raggedright
    \scshape
    \customMedium
    \fontsize{11pt}{12pt}
    \selectfont{#1} 
    \normalfont
}

% Project command
\newcommand{\Project}[2]{\runsubsection{
    \lowercase{
        \href{#2}}{#1 \,\faExternalLink}
    }
    \hfill
}

%------------------------------------------------------
% Section separators command
\newcommand{\sectionsep}[0]{\vspace{6pt}}

% small separators command
\newcommand{\smallSep}[0]{\vspace{3pt}}

% A shortcut to control spacing
\newcommand{\NoSpace}{\vspace{-2pt}}

% remove header footer stuff like page numbers 
\newcommand{\resetHeaderAndFooter}{ 
    \fancyhf{} 
    \fancyfoot{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

% Command to align table at the start of the resume
\newcommand{\alignProfileTable}{
    \raggedbottom
    \raggedright
    \setlength{\tabcolsep}{0in}
}

% Convenience command to create job positions
\newcommand{\resumeHeading}[4]{
    \runsubsection{#1}\descript{| #2}\hfill \location{#3 | #4}
    \NoSpace
}

%------------------------------------------------------
% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{
        \vspace{-1mm}
        \begin{itemize}
        \itemsep1pt 
        \parskip1.5pt 
        \parsep1.5pt
    }{
        \end{itemize}
        \vspace{-\topsep}
    }

\newenvironment{resumeSkillList}{
       \begin{itemize}[leftmargin=0.07cm, label={}]
    }{
        \end{itemize}
    }

% Align Sections
\let\oldSection\section
\renewcommand{\section}[1]{\oldSection{#1}\raggedright}