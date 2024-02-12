\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{summary}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}



% ---------------------------------------------------------------------
% Document setup
% ---------------------------------------------------------------------

\RequirePackage[margin=2cm]{geometry}
\RequirePackage{hyperref,xcolor,graphicx}

\hypersetup{
  pdfpagemode=UseOutlines,
  bookmarksnumbered
}



% ---------------------------------------------------------------------
% Graphics
% ---------------------------------------------------------------------
\RequirePackage{tikz}
\usetikzlibrary{positioning}

\counterwithin{figure}{section}
\newcommand\resources[1]{\graphicspath{{#1}}}



% ---------------------------------------------------------------------
% Math
% ---------------------------------------------------------------------
\RequirePackage{amsmath,amssymb}

\newcommand\bigO{\mathcal{O}}
\newcommand\littleO{\scalebox{.6}{$\scriptscriptstyle\mathcal{O}$}}



% ---------------------------------------------------------------------
% Algorithms
% ---------------------------------------------------------------------
\RequirePackage[longend,ruled,vlined]{algorithm2e}

\counterwithin{algocf}{section}
\SetKwComment{comment}{// }{}
\SetKwComment{explain}{$\triangleright$\ }{}
\newcommand\commentfont[1]{\textcolor{lightgray}{#1}}
\SetCommentSty{commentfont}
\DontPrintSemicolon



% ---------------------------------------------------------------------
% Title page with TOC
% ---------------------------------------------------------------------
\renewcommand*\numberline[1]{\hb@xt@4em{#1\hfil}} % fixes the table of contents text overlap

\newcommand\subject[1]{\def\@subject{#1}}
\newcommand\subtitle[1]{\def\@subtitle{#1}}
\newcommand\semester[1]{\def\@semester{#1}}

\providecommand\@subtitle{Zusammenfassung}

\newcommand\createtitle{
  \begin{titlepage}
    \title{
      \@subject
      \vspace{.5ex}\\
      \large\@subtitle\\
      \small\@semester
    }
    \date{}
    \maketitle
    \thispagestyle{empty}

    \tableofcontents
    \label{toc}
    \addtocontents{toc}{\protect\contentsline{section}{\nameref{toc}}{}{}}
  \end{titlepage}
}