\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rcarticle}[Rémy Cerda's article class]

\LoadClass[12pt]{article}

\RequirePackage{lipsum}


% Polices, caractères, langues
% ----------------------------

\RequirePackage[no-math]{fontspec}
\setmainfont{LibertinusSerif}[
	Extension		= .otf,
	UprightFont		= *-Regular,
	BoldFont		= *-Bold,
	ItalicFont		= *-Italic,
	BoldItalicFont	= *-BoldItalic
]
\setsansfont[Scale=0.86]{FiraSans}[
	Extension		= .otf,
	UprightFont		= *-Regular,
	BoldFont		= *-SemiBold,
	ItalicFont		= *-Italic,
	BoldItalicFont	= *-SemiBoldItalic
]

% Caractères Unicode supplémentaires
\RequirePackage{newunicodechar}
\newunicodechar{⋅}{$\cdot$}

\RequirePackage{polyglossia}
\setmainlanguage{english}
\setotherlanguage{french}


% Mise en forme
% -------------

\RequirePackage{geometry}
\geometry{
	a4paper, twoside,
	inner=2.5cm, outer=3.5cm,
	top=2cm, bottom=1.5cm, includefoot
	}

\RequirePackage[skip=.3\baselineskip plus 1pt]{parskip}
\renewcommand{\baselinestretch}{1.3}

\RequirePackage{titlesec}
\titleformat{\section}%
	{\Large\sffamily\bfseries}%
	{\llap{\makebox[30pt][l]{\raggedleft\thesection}}}{0pt}%
	{}[]
\titleformat{\subsection}%
	{\large\sffamily}%
	{\llap{\makebox[30pt][l]{\raggedleft\thesubsection}}}{0pt}%
	{}[]
\titlespacing{\section}{0pt}{*6}{*3}
\titlespacing{\subsection}{0pt}{*5}{*3}

\RequirePackage{enumitem}
\setlist{
	topsep		= .5\parskip,	% séparation verticale autour de la liste
	itemsep		= .5\parskip,	% séparation verticale entre les items
	parsep		= .5\parskip,	% séparation verticale entre les § d'un item
	itemindent	= 0em,			% indentation du texte
	leftmargin	= 1.5em,		% distance horizontale totale à gauche du texte
}
\setlist[enumerate]{
	align		= left,
	labelwidth	= 1.1em,
	labelsep 	= 0.4em,
	labelindent = !
}
\setlist[itemize]{
	align		= left,
	labelwidth	= 1.0em,
	labelsep 	= 0.4em,
	labelindent = !
}
\setlist[itemize,1]{
	label		= \ensuremath{\blacktriangleright}
}


% Mathématiques
% -------------

\RequirePackage{mathtools}

\RequirePackage{unicode-math}
\unimathsetup{warnings-off={mathtools-colon,mathtools-overbracket}}
\setmathfont{Libertinus Math}
\setmathfont{STIX Two Math}[range={"022C4}]

\AtBeginDocument{\renewcommand{\leq}{\leqslant}}
\AtBeginDocument{\renewcommand{\geq}{\geqslant}}

% Théorèmes
\RequirePackage[hyperref,amsmath,thmmarks]{ntheorem}
\newcommand{\qedhere}{\qed}
% Formatage des théorèmes
\theorembodyfont{\normalfont}
\theorempreskip{\baselineskip}
\theorempostskip{\baselineskip}
%\theoremseparator{.\vspace{.1\baselineskip plus 1pt}}
\theoremseparator{.}
\theoremheaderfont{\sffamily\bfseries}
\renewtheoremstyle{plain}%
	{\item[\hskip\labelsep \theorem@headerfont ##1\ ##2\theorem@separator]}%
	{\item[\hskip\labelsep \theorem@headerfont ##1\ ##2\
 		{\mdseries(##3)}\theorem@separator]}
% Déclaration des environnements de théorèmes
\theoremstyle{plain}
\newtheorem{thm}{Theorem}[section]
\newtheorem{lem}[thm]{Lemma}
\newtheorem{cor}[thm]{Corollary}
\newtheorem{defi}[thm]{Definition}
\newtheorem{rem}[thm]{Remark}
\newtheorem{exa}[thm]{Example}
\newtheorem{conj}[thm]{Conjecture}
\newtheorem{nota}[thm]{Notation}
% Et l'environnement pour les preuves
\newtheoremstyle{nonumberplainreplace}%
	{\item[\theorem@headerfont\hskip\labelsep ##1\theorem@separator]}%
	{\item[\theorem@headerfont\hskip \labelsep ##3\theorem@separator]}
\theoremstyle{nonumberplainreplace}
\theoremindent1.5em
\theorembodyfont{\small}
\theorempreskip{-0.5\baselineskip}
\theoremsymbol{\ensuremath{\smwhtdiamond}}
\newtheorem{proof}{Proof}

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

\DeclareFieldFormat{labelalpha}{\sffamily #1}


% Miscellanées
% ------------

\RequirePackage{csquotes}
\RequirePackage{xcolor}


% Métadonnées
% -----------

% Commandes permettant de définir les métadonnées dans le document principal
\makeatletter
\newcommand{\subtitle}[1]{\newcommand{\@subtitle}{#1}}
\newcommand{\auteurun}[1]{\newcommand{\@auteurun}{#1}}
	\newcommand{\affiliationun}[1]{\newcommand{\@affiliationun}{#1}}
	\newcommand{\emailun}[1]{\newcommand{\@emailun}{#1}}
	\newcommand{\orcidun}[1]{\newcommand{\@orcidun}{#1}}
\newcommand{\auteurdeux}[1]{\newcommand{\@auteurdeux}{#1}}
	\newcommand{\affiliationdeux}[1]{\newcommand{\@affiliationdeux}{#1}}
	\newcommand{\emaildeux}[1]{\newcommand{\@emaildeux}{#1}}
	\newcommand{\orciddeux}[1]{\newcommand{\@orciddeux}{#1}}
\newcommand{\auteurtrois}[1]{\newcommand{\@auteurtrois}{#1}}
	\newcommand{\affiliationtrois}[1]{\newcommand{\@affiliationtrois}{#1}}
	\newcommand{\emailtrois}[1]{\newcommand{\@emailtrois}{#1}}
	\newcommand{\orcidtrois}[1]{\newcommand{\@orcidtrois}{#1}}
\newcommand{\publiinfo}[1]{\newcommand{\@publiinfo}{#1}}
\newcommand{\copyrightinfo}[1]{\newcommand{\@copyrightinfo}{#1}}
\renewcommand{\abstract}[1]{\newcommand{\@abstract}{#1}}
\makeatother

% \maketitle personnalisé
\RequirePackage{fontawesome,academicons,etoolbox,ifthen}
\newcommand{\iconeauteur}[2][1]{\makebox[1.6em][l]{\hspace*{1pt}\makebox[1em]{\scalebox{#1}{#2}}}}
% ... commande affichant les infos d'un auteur
\newcommand{\auteur}[4]{
	{\large\bfseries #1}\par
	\vspace*{2pt}%
	{\small
	\ifthenelse{\equal{#2}{}}{}%
		{\iconeauteur[0.8]{\faInstitution} #2\par}%
	\ifthenelse{\equal{#3}{}}{}%
		{\iconeauteur[0.8]{\faEnvelope} \href{mailto:#3}{#3}\par}%
	\ifthenelse{\equal{#4}{}}{}%
		{\iconeauteur{\aiOrcid} \href{https://orcid.org/#4}{#4}\par}}%
	\vspace{15pt}
}
% ... commande produisant le titre complet
\makeatletter
\renewcommand{\@maketitle}{%
	\thispagestyle{empty}%
	\setlength{\parindent}{0pt}%
	\vspace*{1ex}%
	{%
		\renewcommand{\baselinestretch}{1}%
		\hyphenrules{nohyphenation}\raggedright\sffamily%
	% Titre principal et sous-titre
		{\huge\bfseries\@title\par}
		\ifdef{\@subtitle}{%
			\vspace{3pt}%
			{\Large\bfseries\@subtitle}%
			\vspace{3pt}%
		}{}
		\rule{\textwidth}{2pt}\par
		\vspace{25pt}%
	% Auteurs
		\ifdef{\@auteurun}{\auteur%
			{\@auteurun}%
			{\ifdef{\@affiliationun}{\@affiliationun}{}}%
			{\ifdef{\@emailun}{\@emailun}{}}%
			{\ifdef{\@orcidun}{\@orcidun}{}}%
		}{}
		\ifdef{\@auteurdeux}{\auteur%
			{\@auteurdeux}%
			{\ifdef{\@affiliationdeux}{\@affiliationdeux}{}}%
			{\ifdef{\@emaildeux}{\@emaildeux}{}}%
			{\ifdef{\@orciddeux}{\@orciddeux}{}}%
		}{}
		\ifdef{\@auteurtrois}{\auteur%
			{\@auteurtrois}%
			{\ifdef{\@affiliationtrois}{\@affiliationtrois}{}}%
			{\ifdef{\@emailtrois}{\@emailtrois}{}}%
			{\ifdef{\@orcidtrois}{\@orcidtrois}{}}%
		}{}
		\vspace{10pt}
	% Informations sur l'article
		\@publiinfo\par
		\vspace{5pt}
		{\sffamily\small\@copyrightinfo\par}
		\vspace*{\fill}\par
	}
	% Résumé
	\ifdef{\abstract}{%
		\vspace{9pt}\small%
		{\sffamily\bfseries\abstractname. —} \@abstract\par
	}{}
	\clearpage%
	% Table des matières
	\rule{\textwidth}{1pt}\vspace{-18pt}
	\tableofcontents
	\rule{\textwidth}{1pt}\par
}
\makeatother

% Liste des auteurs dans \auteurs
\makeatletter
\newcommand{\auteurs}{%
	\ifdef{\@auteurun}{\@auteurun}{}%
	\ifdef{\@auteurdeux}{, \@auteurdeux}{}%
	\ifdef{\@auteurtrois}{, \@auteurtrois}{}%
}
\makeatother

\RequirePackage{hyperref}
\definecolor{linkcolor}{HTML}{063560}
\definecolor{urlcolor}{HTML}{4e0656}
\definecolor{citecolor}{HTML}{065631}
\hypersetup{
	colorlinks,
	linkcolor=linkcolor,
	citecolor=citecolor,
	urlcolor=urlcolor
}
\makeatletter
\AtBeginDocument{\hypersetup{
	pdftitle={\@title},
	pdfauthor={\auteurs}
}}
\makeatother


% Références croisées
% -------------------

\RequirePackage{cleveref}
\crefname{thm}{Theorem}{Theorems}
\crefname{lem}{Lemma}{Lemmas}
\crefname{cor}{Corollary}{Corollaries}
\crefname{defi}{Definition}{Definitions}
\crefname{rem}{Remark}{Remarks}
\crefname{exa}{Example}{Examples}
\crefname{conj}{Conjecture}{Conjectures}
\crefname{nota}{Notation}{Notations}