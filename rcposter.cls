\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rcposter}[Rémy Cerda's poster class, adapted from tikzposter]

\LoadClass{tikzposter}


% Fonts
% -------------------------------------

% There might be some conflicts between the math fonts for some characters!
% This won't be a problem for generating (and displaying) a PDF, but could
% cause some missing characters in the printed version of the poster...
% If this happens, please post an issue on the Github repo (and indicate the
% conflicting character/command), so that I can try to fix it!

\RequirePackage[no-math]{fontspec}
\setmainfont{Fira Sans}
\setmonofont{FiraMono-Regular.otf}

\RequirePackage{mathtools}
\RequirePackage[warnings-off={mathtools-colon,mathtools-overbracket}]{unicode-math}
\setmathfont{Fira Math}
\setmathfont{STIX Two Math}[range={cal,frak,\bigcup,\vdots,\bot}]


% Theme and global styling
% -------------------------------------

\usetheme{Simple}

\definecolor{postermain}{HTML}{325fba}

\definecolor{posterbox1}{HTML}{2277dd}
\definecolor{posterbox2}{HTML}{0099bb}

\definecolor{notebgcolor}{HTML}{ff88aa}

% Better vertical placement for subcolumns
\makeatletter
\patchcmd{\subcolumn}{\TP@subcoltop}{{\TP@subcoltop+1.5cm}}{}{}
\makeatother


% Main title
% -------------------------------------

\usetitlestyle{Filled}
\colorlet{titlefgcolor}{black}
\colorlet{titlebgcolor}{white}

\usepackage{wrapfig}

\makeatletter

	% Removes a box around \@title that prevented line breaks
	% (see the original definition in tikzposter.cls).
	\def\title#1{\gdef\@title{#1}}
	
	% Custom function executed when running \maketitle.
	\settitle{
		\begin{minipage}{0.95\textwidth}
			\begin{wrapfigure}{r}{7cm}
				\vspace*{-2.3cm}\centering\@titlegraphic
			\end{wrapfigure}
			\color{titlefgcolor}
			\vspace{10mm}
			{\addfontfeature{Scale=3.5}\bfseries \@title} \par
			\vspace{16mm}
			{\addfontfeature{Scale=2.5} \@author} \par
			\vspace{12mm}
			{\addfontfeature{Scale=1.8} \@institute}
		\end{minipage}
	}

\makeatother


% Sections
% -------------------------------------

\colorlet{sectionbgcolor}{postermain}
\colorlet{sectionfgcolor}{white}

\defineblockstyle{section}{
	titleinnersep=1cm, 
	bodyinnersep=0cm
}{
	\draw[
		color=sectionfgcolor, 
		fill=sectionbgcolor,
		rounded corners=\blockroundedcorners
	] 
	(blocktitle.south west) rectangle (blocktitle.north east);
}

\newcommand{\sectiontitle}[1]{
{
	\colorlet{blocktitlefgcolor}{white}
	\useblockstyle{section}
	\block[titlewidthscale=1.1, bodywidthscale=0]{\centering\scshape\huge #1}{}
	\useblockstyle{element}
}}


% Blocs élémentaires
% -------------------------------------

\colorlet{blocktitlefgcolor}{postermain}

\defineblockstyle{element}{
	titleoffsety=8mm,
	bodyoffsety=8mm,
	titleinnersep=7mm, 
	bodyinnersep=7mm,
	titlecenter
}{
%%	Uncomment to add a border around the blocks and the block titles.
%%
%	\draw[rounded corners=\blockroundedcorners, inner sep=\blockbodyinnersep,
%	line width=0.5\blocklinewidth, color=elementcolor!40,
%	top color=white, bottom color=white,
%	%fill=blockbodybgcolor
%	]
%	(blockbody.south west) rectangle (blockbody.north east); %
%	\ifBlockHasTitle%
%	\draw[rounded corners=\blockroundedcorners, inner sep=\blocktitleinnersep,
%	top color=white, bottom color=white,
%	line width=0.5\blocklinewidth, color=elementcolor!40
%	]
%	(blocktitle.south west) rectangle (blocktitle.north east); %
%	\fi%
}


% Colored blocks inside an element
% -------------------------------------

\newcommand{\posterbox}[3]{
	\colorlet{innerblocktitlefgcolor}{#1}
	\colorlet{innerblockbodybgcolor}{innerblocktitlefgcolor!10}
	\colorlet{innerblocktitlebgcolor}{innerblocktitlefgcolor!20}
	\vspace*{0.6cm}
	\innerblock[roundedcorners=0]{#2}{#3}
	\vspace{0.5cm}
}


% Other stuff
% -------------------------------------

\RequirePackage{enumitem}
\setlist{itemsep=-5pt}

\RequirePackage{lipsum}
