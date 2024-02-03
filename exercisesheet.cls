\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exercisesheet}

\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[margin=5em]{geometry}
\RequirePackage{hyperref, multicol, environ}
\RequirePackage{amsmath, amssymb}
\RequirePackage{tikz}
\RequirePackage[longend,ruled,vlined]{algorithm2e}

% ---------------------------------------------------------------------
% Document setup
% ---------------------------------------------------------------------
\hypersetup{
  pdfpagemode=UseOutlines,
  bookmarksnumbered
}

\newcommand\subject[1]{
  \def\@subject{#1}
}

\newcommand\semester[1]{
  \def\@semester{#1}
}

\newcommand{\resources}[1]{
  \graphicspath{{#1}}
}

% ---------------------------------------------------------------------
% Title page
% ---------------------------------------------------------------------
\renewcommand*{\numberline}[1]{\hb@xt@4em{#1\hfil}}

\newcommand{\createtitle}{
  \begin{titlepage}
    \title{
      \@subject
      \vspace{.5em}\\
      \large Übungsaufgaben \ifsolutions mit Lösungen\fi\\
      \small\@semester
    }
    \date{}
    \maketitle
    \thispagestyle{empty}

    \tableofcontents
    \label{toc}\addcontentsline{toc}{section}{\nameref{toc}}
  \end{titlepage}
}

% ---------------------------------------------------------------------
% Solutions toggle
% ---------------------------------------------------------------------
\newif\ifsolutions
\def\withsolutions{\global\solutionstrue}

% ---------------------------------------------------------------------
% Exercises
% ---------------------------------------------------------------------
\newcommand{\sheet}[2][\relax]{
  \newpage

  \ifx#1\empty
    \section*{#2}\addcontentsline{toc}{section}{#2}
  \else
    \ifx#1\relax
    \else
      \setcounter{section}{#1}
      \addtocounter{section}{-1}
    \fi
    \section{#2}
  \fi
}

% #1: optional exercise number
% #2: exercise title
% BODY: singular exercise
\newenvironment{exercise}[2][\relax]{
  \ifx#1\relax\else
    \setcounter{subsection}{#1}
    \addtocounter{subsection}{-1}
  \fi
  \subsection{#2}
}{}

% #1: optional exercise number
% #2: exercise title
% #3: exercise intro
% BODY: exercises
\newenvironment{eexercises}[3][\relax]{
  \exercise[#1]{#2}
  #3
  \begin{enumerate}
    }{
  \end{enumerate}
}

% #1: optional exercise number
% #2: exercise title
% BODY: exercises
\newenvironment{exercises}[2][\relax]{
  \begin{eexercises}[#1]{#2}{}
    }{
  \end{eexercises}
}

\newcommand{\psolution}[1]{
  \ifsolutions
    #1
  \fi
}

\NewEnviron{solution}{
  \ifsolutions
    \subsubsection*{Lösung:}
    \BODY
  \fi
}

\NewEnviron{esolutions}[1]{
  \ifsolutions
    \subsubsection*{Lösung:}
    #1
    \begin{enumerate}
      \BODY
    \end{enumerate}
  \fi
}

\NewEnviron{solutions}{
  \ifsolutions
    \subsubsection*{Lösung:}
    \begin{enumerate}
      \BODY
    \end{enumerate}
  \fi
}

% ---------------------------------------------------------------------
% Custom commands
% ---------------------------------------------------------------------

\newcommand{\hint}[1]{
  \vspace{.5em}\par
  \textbf{Hinweis}: \textit{#1}
}

\newcommand{\points}[1][\relax]{
  \ifx#1\relax
    \hfill(\textit{$1$~Punkt})
  \else
    \hfill(\textit{$#1$~Punkte})
  \fi
}

\newcommand{\bigO}{
  \ensuremath{\mathcal{O}}
}

% ---------------------------------------------------------------------
% Custom symbols
% ---------------------------------------------------------------------
\newcommand\xmark{$\times$}