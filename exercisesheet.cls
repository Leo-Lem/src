\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exercisesheet}

% Updating the subtitle
\providecommand\@subtitle{Übungsaufgaben \ifsolutions mit Lösungen\fi}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{summary}}
\ProcessOptions\relax
\LoadClass{summary}



% ---------------------------------------------------------------------
% Document setup
% ---------------------------------------------------------------------
\RequirePackage{multicol, environ, graphicx, subfig}


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

\newcommand{\induction}[3]{
  \textbf{IA} ($n\leftarrow 0$):\quad$#1$\\
  \textbf{IV} ($n\leftarrow n$):\quad$#2$\\
  \textbf{IS} ($n\leftarrow n+1$): \begin{align*}#3\end{align*}
}

\newcommand{\invariant}[3]{
  \textbf{Initialisierung}: #1\\
  \textbf{Erhaltung}: #2\\
  \textbf{Termination}: #3
}

\newcommand\xmark{$\times$}