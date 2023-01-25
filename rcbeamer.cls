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


% Mathématiques
% -------------

\RequirePackage{mathtools}

\RequirePackage{unicode-math}
\unimathsetup{warnings-off={mathtools-colon,mathtools-overbracket}}
\setmathfont{Fira Math}
\setmathfont{STIX Two Math}[range={"022C4}]

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

\renewcommand{\bibfont}{\small}


% Miscellanées
% ------------

\RequirePackage{csquotes}
