\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exercisesheet}

\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[margin=2cm]{geometry}
\RequirePackage{hyperref, tikz, amsmath, multicol, environ}

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
\def\solutions{\global\solutionstrue}

% ---------------------------------------------------------------------
% Custom symbols
% ---------------------------------------------------------------------
\newcommand\checkmark{\tikz\fill[scale=0.4](0,.35) -- (.25,0) -- (1,.7) -- (.25,.15) -- cycle;}
\newcommand\xmark{$\times$}

% ---------------------------------------------------------------------
% Exercises
% ---------------------------------------------------------------------
\newcommand{\exercisesheet}[2][\relax]{
  \ifx#1\relax
    \section{#2}
  \else
    \setcounter{section}{#1}
    \addtocounter{section}{-1}
    \section{#2}
  \fi
}

\newenvironment{exercise*}[2][\relax]{
  \ifx#1\relax
    \subsection{#2}
  \else
    \setcounter{subsection}{#1}
    \addtocounter{subsection}{-1}
    \subsection{#2}
  \fi
}{
}

\newenvironment{exercise}[2][\relax]{
  \ifx#1\relax
    \subsection{#2}
  \else
    \setcounter{subsection}{#1}
    \addtocounter{subsection}{-1}
    \subsection{#2}
  \fi

  \begin{enumerate}
    }{
  \end{enumerate}
}

\NewEnviron{solution*}{
  \ifsolutions
    \subsubsection*{Lösung:}
    \BODY
  \fi
}

\NewEnviron{solution}{
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
  \vspace{.5em}\newline
  \textbf{Hinweis}: \textit{#1}
}