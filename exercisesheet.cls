\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exercisesheet}

\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[margin=2cm]{geometry}
\RequirePackage{hyperref, tikz, amsmath, environ, multicol}

% ---------------------------------------------------------------------
% Document setup
% ---------------------------------------------------------------------
\newcommand{\setuppdf}{
    \hypersetup{
      pdfpagemode=UseOutlines,
      bookmarksnumbered
  }
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

\newenvironment{solution*}{
  \ifsolutions
    \subsubsection*{Lösung:}
}{
}

\newenvironment{solution}{
  \ifsolutions
    \subsubsection*{Lösung:}
    \begin{enumerate}
}{
    \end{enumerate}
}