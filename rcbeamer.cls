\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rcbeamer}[Rémy Cerda's beamer class, adapted from metropolis 
theme]

\LoadClass{beamer}


% Thème, mise en forme
% --------------------

\usetheme{metropolis}

% Options for Metropolis
\metroset{
	titleformat			= smallcaps,
	numbering			= fraction,
	progressbar			= foot,
}

% The main color of the template
\definecolor{macouleur}{HTML}{00AAFF}
\colorlet{color0}{white}
\colorlet{color1}{macouleur}
\colorlet{color2}{green}
\RenewDocumentCommand \c {m} {\color{color#1}}
\NewDocumentCommand \Emph {m} {{\color{macouleur}\textbf{#1}}}

% Color definitions
\setbeamercolor{normal text}{
	fg	= white,
	bg	= black!95
}
\setbeamercolor{alerted text}{
	fg	= macouleur
}

% Width of the horizontal rules
\makeatletter
\setlength{\metropolis@titleseparator@linewidth}{1.5pt}
\setlength{\metropolis@progressinheadfoot@linewidth}{1.5pt}
\setlength{\metropolis@progressonsectionpage@linewidth}{1.5pt}
\makeatother

% Solves a bug in the spacing of blocks, see:
% https://github.com/matze/mtheme/issues/307
\let\oldblock\block
\let\endoldblock\endblock
\renewenvironment{block}[1]{
	\begin{alertblock}{#1}
	\vspace{0pt}
}{
	\end{alertblock}
}

% Customisation of the lists
\setbeamercolor{enumerate item}{fg=macouleur}  
\setbeamercolor{itemize item}{fg=macouleur}  
\setbeamertemplate{itemize item}[triangle]

% ToC
\makeatletter
\patchcmd{\beamer@sectionintoc}
  {\vfill}
  {\vskip\itemsep}
  {}
  {}
\makeatother
\setbeamerfont{subsection in toc}{size=\small}


% Polices, caractères, langues
% ----------------------------

% Load Fira again, but not the Light version
\RequirePackage[no-math]{fontspec}
\setsansfont{FiraSans}[
	Extension		= .otf,
	UprightFont		= *-Regular,
	BoldFont		= *-SemiBold,
	ItalicFont		= *-Italic,
	BoldItalicFont	= *-SemiBoldItalic
]

% Caractères Unicode supplémentaires
\RequirePackage{newunicodechar}
\newunicodechar{⋅}{$\cdot$}

% Language support
\RequirePackage{polyglossia}
\setmainlanguage{english}
\setotherlanguage{french}

\RequirePackage{xspace}


% Mathématiques
% -------------

\RequirePackage{mathtools}

\RequirePackage{unicode-math}
\unimathsetup{warnings-off={mathtools-colon,mathtools-overbracket}}
\setmathfont{Libertinus Math}
\setmathfont{FiraMath-Regular.otf}[range={up,it,bfup,bb,"00040,"0221E}]
\setmathfont{STIXTwoMath-Regular.otf}[range={cal,"022C4}]

\AtBeginDocument{\renewcommand{\leq}{\leqslant}}
\AtBeginDocument{\renewcommand{\geq}{\geqslant}}

% Graphismes
\RequirePackage{tikz}
\usetikzlibrary{positioning}
\usetikzlibrary{arrows.meta}

% Arbres de preuve
\RequirePackage{ebproof}
\newcommand{\regle}[1]{(#1)}
\ebproofset{ right label template={$\regle{\inserttext}$} }


% Bibliographie
% -------------

\RequirePackage[style=alphabetic]{biblatex}
\ExecuteBibliographyOptions{sorting=nyt}

\renewcommand{\bibfont}{\scriptsize}


% Miscellanées
% ------------

\RequirePackage{csquotes}

\tikzset{
    invisible/.style={opacity=0},
    visible on/.style={alt={#1{}{invisible}}},
    alt/.code args={<#1>#2#3}{%
      \alt<#1>{\pgfkeysalso{#2}}{\pgfkeysalso{#3}}%
  }
}
