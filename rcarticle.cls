\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rcarticle}[Rémy Cerda's article class]

\LoadClass[12pt]{article}

% Option for a short title (no abstract, no ToC, spans over ~half a page)
% Default: false (long title)
\newif\ifrcshorttitle \rcshorttitlefalse
\DeclareOption{shorttitle}{\rcshorttitletrue}
% Option for displaying authors in two columns
% Default: false (one column)
\newif\ifrctwocolauth \rctwocolauthfalse
\DeclareOption{twocolauth}{\rctwocolauthtrue}
% Option for narrower lines (this shrinks several vertical skips)
% Default: false (normal lines)
\newif\ifrcnarrowlines \rcnarrowlinesfalse
\DeclareOption{narrowlines}{\rcnarrowlinestrue}
% Option to enable section-dependent theorem numbering
% Default: true (theorems numbered according to sections)
\newif\ifrcthminsec \rcthminsectrue
\DeclareOption{thmnotinsec}{\rcthminsecfalse}
\ProcessOptions

\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage{chngcntr}
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

% Couleurs
\RequirePackage{xcolor}
\definecolor{c1}{Hsb}{210, 1  , 0.5}
\definecolor{c2}{Hsb}{210, 0.7, 0.8}
\colorlet{c0}{black}
\newcommand{\co}[1]{\color{c#1}}

\RequirePackage{xspace}


% Mise en forme
% -------------

% Global layout of the page

\RequirePackage{geometry}
\geometry{
	a4paper, twoside,
	inner=2.5cm, outer=3.5cm,
	top=2cm, bottom=1.5cm, includefoot
	}

% Vertical spacing

\ifrcnarrowlines
	\RequirePackage[skip=.2\baselineskip plus 1pt]{parskip}
	\else 
	\RequirePackage[skip=.3\baselineskip plus 1pt]{parskip}
\fi

\ifrcnarrowlines
	\renewcommand{\baselinestretch}{1.25}
	\else
	\renewcommand{\baselinestretch}{1.3}
\fi

% Headings

\RequirePackage{titlesec}
\titleformat{\section}%
	{\Large\sffamily\bfseries}%
	{\llap{\makebox[30pt][l]{\raggedleft\thesection}}}{0pt}%
	{}[]
\titleformat{\subsection}%
	{\large\sffamily}%
	{\llap{\makebox[30pt][l]{\raggedleft\thesubsection}}}{0pt}%
	{}[]
\ifrcnarrowlines
	\titlespacing{\section}{0pt}{*3}{*3}
	\titlespacing{\subsection}{0pt}{*2.5}{*1.5}
	\else
	\titlespacing{\section}{0pt}{*6}{*3}
	\titlespacing{\subsection}{0pt}{*5}{*3}
\fi

% Lists

\RequirePackage[inline]{enumitem}
\setlist{
	itemindent	= 0em,			% indentation du texte
	leftmargin	= 1.5em,		% distance horizontale totale à gauche du texte
}
\ifrcnarrowlines
	\setlist{
		topsep		= .3\parskip,	% séparation verticale autour de la liste
		itemsep		= .3\parskip,	% séparation verticale entre les items
		parsep		= .3\parskip,	% séparation verticale entre les § d'un item
	}
	\else 
	\setlist{
		topsep		= .5\parskip,	% séparation verticale autour de la liste
		itemsep		= .5\parskip,	% séparation verticale entre les items
		parsep		= .5\parskip,	% séparation verticale entre les § d'un item
	}
\fi 
\setlist[enumerate]{
	align		= left,
	labelwidth	= 1.1em,
	labelsep 	= 0.4em,
	labelindent = !,
	format 		= \sffamily\co2,
}
\setlist[itemize]{
	align		= left,
	labelwidth	= 1.0em,
	labelsep 	= 0.4em,
	labelindent = !,
	format 		= \co2,
}
\setlist[itemize,1]{
	label		= \ensuremath{\mdlgblksquare}
}

% Floating elements (figures, tables...)

\RequirePackage{float}
\floatstyle{boxed}
\restylefloat{table}
\restylefloat{figure}

\RequirePackage{subcaption}
\captionsetup{subrefformat=parens}

\RequirePackage{caption}
\DeclareCaptionLabelSeparator{dotcad}{. — }
\captionsetup{
	labelfont	= {sf,bf},
	labelsep	= dotcad,
	margin		= 1.5em,
}


% Mathématiques
% -------------

\RequirePackage{mathtools}

\RequirePackage{unicode-math}
\unimathsetup{warnings-off={mathtools-colon,mathtools-overbracket}}
\setmathfont{Libertinus Math}
\setmathfont{STIX Two Math}[range={"022C4,bb}]

\allowdisplaybreaks

\AtBeginDocument{\renewcommand{\epsilon}{\varepsilon}}
\AtBeginDocument{\renewcommand{\leq}{\leqslant}}
\AtBeginDocument{\renewcommand{\geq}{\geqslant}}

% Théorèmes
% ---------

\RequirePackage[hyperref,amsmath,thmmarks]{ntheorem}
\RequirePackage{thmtools,thm-restate}
\newcommand{\qedhere}{\qed}

% Formatage des théorèmes

\theorembodyfont{\normalfont}
\theoremseparator{.}
\theoremheaderfont{\sffamily\bfseries}

\ifrcnarrowlines
	\theorempreskip{2.5\parskip}
	\theorempostskip{2.5\parskip}
	\else
	\theorempreskip{3\parskip}
	\theorempostskip{3\parskip}
\fi

% Styles personnalisés

\renewtheoremstyle{plain}%
	{\item[\hskip\labelsep \theorem@headerfont ##1\ ##2\theorem@separator]}%
	{\item[\hskip\labelsep \theorem@headerfont ##1\ ##2\
 		{\mdseries(##3)}\theorem@separator]}
\renewtheoremstyle{nonumberplain}%
	{\item[\hskip\labelsep \theorem@headerfont ##1\theorem@separator]}%
	{\item[\hskip\labelsep \theorem@headerfont ##1\
 		{\mdseries(##3)}\theorem@separator]}
\newtheoremstyle{noparplain}%
	{\item[\hskip\labelsep \theorem@headerfont ##1\ ##2\theorem@separator]}%
	{\item[\hskip\labelsep \theorem@headerfont ##1\ ##2\
 		{\mdseries ##3}\theorem@separator]}
\newtheoremstyle{noparnonumberplain}%
	{\item[\hskip\labelsep \theorem@headerfont ##1\theorem@separator]}%
	{\item[\hskip\labelsep \theorem@headerfont ##1\
 		{\mdseries ##3}\theorem@separator]}

% Déclaration des environnements de théorèmes

% Hooks for all theorems
\newcommand{\thmpre}{\counterwithin{equation}{thm}}
\newcommand{\thmpost}{\counterwithout{equation}{thm}}

\ifrcthminsec
\declaretheorem[	name=Theorem,
	style=plain,
	within=section,
	preheadhook=\thmpre, postfoothook=\thmpost,
	]{thm}
\else 
\declaretheorem[	name=Theorem,
	style=plain,
	preheadhook=\thmpre, postfoothook=\thmpost,
	]{thm}
\fi 
\declaretheorem[	name=Lemma,
	style=plain,
	numberlike=thm,
	preheadhook=\thmpre, postfoothook=\thmpost,
	]{lem}
\declaretheorem[	name=Corollary,
	style=plain,
	numberlike=thm,
	preheadhook=\thmpre, postfoothook=\thmpost,
	]{cor}
\declaretheorem[	name=Definition,
	style=plain,
	numberlike=thm,
	preheadhook=\thmpre, postfoothook=\thmpost,
	]{defi}
\declaretheorem[	name=Remark,
	style=plain,
	numberlike=thm,
	preheadhook=\thmpre, postfoothook=\thmpost,
	]{rem}
\declaretheorem[	name=Example,
	style=plain,
	numberlike=thm,
	preheadhook=\thmpre, postfoothook=\thmpost,
	]{exa}
\declaretheorem[	name=Conjecture,
	style=plain,
	numberlike=thm,
	preheadhook=\thmpre, postfoothook=\thmpost,
	]{conj}
\declaretheorem[	name=Notation,
	style=plain,
	numberlike=thm,
	preheadhook=\thmpre, postfoothook=\thmpost,
	]{nota}

% Et l'environnement pour les preuves
\newtheoremstyle{nonumberplainreplace}%
	{\item[\theorem@headerfont\hskip\labelsep ##1\theorem@separator]}%
	{\item[\theorem@headerfont\hskip \labelsep ##3\theorem@separator]}
\theoremstyle{nonumberplainreplace}
\theoremindent1.5em
\theorembodyfont{\small}
\ifrcnarrowlines{}\else\theorempreskip{-\parskip}\fi
\ifrcnarrowlines\theorempostskip{3\parskip}\else{}\fi 
\theoremsymbol{\hspace{1em}\co1\ensuremath{\mdlgblkdiamond}}
\declaretheorem[	name=Proof,
	style=nonumberplainreplace,
	preheadhook=\thmpre, postfoothook=\thmpost,
	]{proof}

% Graphismes
\RequirePackage{tikz}
\usetikzlibrary{positioning}
\usetikzlibrary{arrows.meta}

\usepackage{tikz-cd}
\tikzcdset{
	arrow style=math font
}

% Arbres de preuve
\RequirePackage{ebproof}
\newcommand{\regle}[1]{(#1)}
\ebproofset{ right label template={$\regle{\inserttext}$} }


% Bibliographie
% -------------

\RequirePackage[style=alphabetic]{biblatex}
\ExecuteBibliographyOptions{
	sorting=nyt,
	maxnames=4,
	useprefix,
}

\renewcommand{\bibfont}{\small}

\DeclareFieldFormat{labelalpha}{\sffamily #1}


% Miscellanées
% ------------

\RequirePackage{array}
\RequirePackage{csquotes}
\RequirePackage{needspace}


% Métadonnées et titre principal
% ------------------------------

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

\RequirePackage{fontawesome,academicons}
\newcommand{\iconeauteur}[2][1]{\makebox[1.6em][l]{\hspace*{1pt}\makebox[1em]{\scalebox{#1}{#2}}}}

% ... commandes affichant les infos d'un auteur

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
	\vspace*{15pt}
}
\makeatletter
\newcommand{\printauteurun}{\auteur%
	{\@auteurun}%
	{\ifdef{\@affiliationun}{\@affiliationun}{}}%
	{\ifdef{\@emailun}{\@emailun}{}}%
	{\ifdef{\@orcidun}{\@orcidun}{}}%
}
\newcommand{\printauteurdeux}{\auteur%
	{\@auteurdeux}%
	{\ifdef{\@affiliationdeux}{\@affiliationdeux}{}}%
	{\ifdef{\@emaildeux}{\@emaildeux}{}}%
	{\ifdef{\@orciddeux}{\@orciddeux}{}}%
}
\newcommand{\printauteurtrois}{\auteur%
	{\@auteurtrois}%
	{\ifdef{\@affiliationtrois}{\@affiliationtrois}{}}%
	{\ifdef{\@emailtrois}{\@emailtrois}{}}%
	{\ifdef{\@orcidtrois}{\@orcidtrois}{}}%
}
\makeatother

% ... commande produisant le titre complet

\makeatletter
\renewcommand{\@maketitle}{\co1
	\ifrcshorttitle{}\else\thispagestyle{empty}\fi%
	\setlength{\parindent}{0pt}%
	\vspace*{1ex}%
	{%
		\renewcommand{\baselinestretch}{1}%
		\hyphenrules{nohyphenation}\raggedright\sffamily%
	% Titre principal et sous-titre
		{\huge\bfseries\@title\par}
		\ifdef{\@subtitle}{%
			\vspace{5pt}%
			{\Large\bfseries\@subtitle\par}%
			\vspace{3pt}%
		}{}
		\ifrcshorttitle{}\else\rule{\textwidth}{2pt}\fi\par
		\vspace{25pt}%
	% Auteurs
		\ifdef{\@auteurun}{\ifrctwocolauth
			\begin{minipage}[t]{0.45\textwidth}\printauteurun\end{minipage}%
			\else\printauteurun\fi%
		}{}
		\ifdef{\@auteurdeux}{\ifrctwocolauth\hspace{0.05\textwidth}%
			\begin{minipage}[t]{0.45\textwidth}\printauteurdeux\end{minipage}%
			\else\printauteurdeux\fi%
		}{}
		\ifdef{\@auteurtrois}{\ifrctwocolauth\par
			\begin{minipage}[t]{0.45\textwidth}\printauteurtrois\end{minipage}%
			\hspace{0.05\textwidth}%
			\else\printauteurtrois\fi%
		}{}
		\ifrctwocolauth\par\fi
		\vspace{10pt}
	% Informations sur l'article
		\@publiinfo\par
		\vspace{5pt}
		{\sffamily\small\@copyrightinfo\par}
		\ifrcshorttitle\vspace*{5pt}
		\else\vspace*{\fill}%
		\fi\par
	}
	\ifrcshorttitle{}\else
		% Résumé
		\ifdef{\@abstract}{%
			\vspace{9pt}\small%
			{\sffamily\bfseries\abstractname. —} \@abstract\par
		}{}
		\clearpage\co0
		% Table des matières
		\rule{\textwidth}{1pt}\vspace{-15pt}
		\tableofcontents
		\vspace*{5pt}
	\fi%
	\vspace{5pt}
	\rule{\textwidth}{1pt}\vspace{10pt}\par\vspace{10pt}
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


% Métadonnées PDF

\RequirePackage{hyperref}
%\definecolor{linkcolor}{HTML}{063560}
%\definecolor{urlcolor}{HTML}{4e0656}
%\definecolor{citecolor}{HTML}{065631}
\hypersetup{
	colorlinks,
	linkcolor=c1,
	citecolor=c1,
	urlcolor=c1,
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

\crefname{diagram}{diag.}{diags.}
	\creflabelformat{diagram}{(#2#1#3)}
