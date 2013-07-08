w\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vuwthesis}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions

\LoadClass{report}

\RequirePackage{ifpdf}					% conditionals for this class file
\RequirePackage[english]{babel}				% default language
\RequirePackage[T1]{fontenc}				% prevent T1 encoding error
\RequirePackage{setspace}				% line spacing
\RequirePackage{geometry}				% page geometry
\ifpdf
	\RequirePackage[pdftex]{graphicx}		% figures package [for pdflatex]
\else
	\RequirePackage[dvips]{graphicx}		% figures package [for latex]
\fi
\RequirePackage[version=3]{mhchem}			% chemical formulas
\RequirePackage{chemcompounds}				% numbered structures
\RequirePackage{color}					% color support
\RequirePackage{multirow}				% row spanning in tables
\RequirePackage[numbers,sort&compress,super]{natbib}	% ACS referencing
\RequirePackage{times}					% times font
\RequirePackage{threeparttable}				% tables with footnotes
\RequirePackage{rotating}				% sideways tables
\RequirePackage{caption}				% new floats and caption layout
\RequirePackage{subfigure}				% subfigures
\RequirePackage{amssymb}				% slanted greater/less than or equals to
\RequirePackage{listings}				% source code support
\RequirePackage[floats=float]{chemscheme}		% modification of labels in schemes
\ifpdf
	\RequirePackage{epstopdf}			% eps to pdf conversion on the fly [for pdflatex]
	\RequirePackage[pdftex]{hyperref}		% hyperlinks [for pdflatex]
\else
	\RequirePackage[dvips]{hyperref}		% hyperlinks [for latex]
\fi
%\RequirePackage[nonumberlist,toc]{glossaries}		% glossary package
\RequirePackage[toc,nonumberlist]{glossaries}
\RequirePackage{units}
\RequirePackage{booktabs}

% Add a \textsubscript command equivalent to \textsuperscript
% From subscript.sty code fragment on CTAN
\DeclareRobustCommand*\textsubscript[1]{%
  \@textsubscript{\selectfont#1}}
\def\@textsubscript#1{%
  {\m@th\ensuremath{_{\mbox{\fontsize\sf@size\z@#1}}}}}

\lstset{basicstyle=\footnotesize\ttfamily}
\lstset{breaklines=true,showstringspaces=false}
\lstset{tabsize=3,breakindent=15pt}
\lstset{numbers=left,numberstyle=\tiny,stepnumber=5,numbersep=5pt,firstnumber=1}
\lstloadlanguages{[Visual]C++,Matlab}

%\descriptionwidth=0.8\linewidth			% use a wider glossary than the default 0.6\linewidth
%\setglossary{delimT={\cr & \cr},gloskip={}}	% stop the glossary from grouping alphabetically

\geometry{hmargin={4cm,2cm},vmargin={1.5cm,2cm}}
\setlength{\parindent}{0pt}
\setlength{\parskip}{14pt plus 2pt minus 1pt}

\def\@biblabel#1{#1.}

\def\degree#1{\gdef\@degree{#1}}
\def\subject#1{\gdef\@subject{#1}}
\def\institution#1{\gdef\@institution{#1}}
\def\logo#1{\gdef\@logo{#1}}

\renewcommand\maketitle{\begin{titlepage}%
	\let\footnotesize\small
	\let\footnoterule\relax
	\let \footnote \thanks
	\begin{center}\begin{large}%
		{\ } \par
		\vspace{1.5cm}
		{\huge\bfseries\@title\par}%
		\vspace{2cm}
		{by\\ \@author}\par
		\vspace{0.08\textheight}
		\includegraphics[height=4cm]{\@logo}\par
		\vspace{0.06\textheight}
		{A thesis proposal\\ submitted to \@institution\\
		 in fulfilment of the\\requirements for the degree of\\
		 \@degree\\in \@subject.\\ \vspace{2cm}
		 \@institution\\ \@date \par}%
	\end{large}\end{center}\par
\end{titlepage}
\setcounter{footnote}{0}%
\global\let\thanks\relax
\global\let\maketitle\relax
\global\let\@thanks\@empty
\global\let\@author\@empty
\global\let\@date\@empty
\global\let\@title\@empty
\global\let\title\relax
\global\let\author\relax
\global\let\date\relax
\global\let\and\relax
}

\renewcommand{\@makechapterhead}[1]{
	{
		\normalfont \centering \bfseries \Large
		\ifnum \c@secnumdepth >\m@ne
			\begin{itshape}
				\@chapapp\space\thechapter\par
			\end{itshape}
		\fi
		#1\par
		\vspace{0.5cm}%
	}
}

\renewcommand{\@makeschapterhead}[1]{
	{
		\normalfont \centering \bfseries \Large
		#1\par
		\vspace{0.5cm}%
	}
}

\renewcommand{\contentsname}{Table of Contents}
\renewcommand{\bibname}{References}

% Redefine the default placement of figures and table as bp (not tbp).
% I like figures/tables etc only to occur AFTER they are mentioned in
% the text. Because the chemscheme package doesn't define the scheme
% environment's placement until \begin{document} the redefinition of
% the scheme's placement must occur in thesis.tex.
\floatplacement{figure}{bp}
\floatplacement{table}{bp}

\newfloat{structure}{hbp}{lox}[chapter]
%\DeclareCaptionType[fileext=lox,placement=hbp,within=chapter]{structure}[Structure][List of Structures]

\captionsetup{labelfont=bf,labelsep=space,justification=centering}

\newcommand{\sub}[1]{$_{\mbox{#1}}$}
\newcommand{\textprime}{$\textquoteright$}

% Shortcuts for pKa and pKb
\newcommand{\pKa}{p\emph{K}\textsubscript{a}}
\newcommand{\pKb}{p\emph{K}\textsubscript{b}}

% Shortcuts for NMR intros
\newcommand{\Protonintro}[2]{\proton{} NMR (#1 MHz, \ce{#2}): $\delta{}$}
\newcommand{\Phosphorusintro}[1]{\phosphorus{} NMR (121 MHz, \ce{#1}): $\delta{}$}
\newcommand{\Carbonintro}[2]{\carbon{} NMR (#1 MHz, \ce{#2}): $\delta{}$}
\newcommand{\Fluorineintro}[1]{\fluorine{} NMR (282 MHz, \ce{#1}): $\delta{}$}

% Shortcuts for NMR data
\newcommand{\NMRPC}[4]{#1 (#2, \JPC{}~=~#3~Hz, #4)}  % C1 (C2, \JPC{}~=~C3~Hz)
\newcommand{\NMRAgP}[3]{#1 (d, \JAgPseven{}~=~#2~Hz, d, \JAgPnine{}~=~#3~Hz)}
\newcommand{\NMRPH}[4]{#1 (#2, \JPH{}~=~#3~Hz, #4)} 
\newcommand{\NMRPPt}[2]{#1 (s, \JPtP{}~=~#2~Hz)}
\newcommand{\NMRPtwoPt}[4]{#1 (#2, \JPtP{}~=~#3~Hz, #4)}
\newcommand{\NMRPtH}[5]{#1 (#2, \textsuperscript{#3}\JPtH{}~=~#4~Hz, #5)}
\newcommand{\NMRPtC}[5]{#1 (#2, \textsuperscript{#3}\JPtC{}~=~#4~Hz, #5)}
\newcommand{\NMRHH}[4]{#1 (#2, #3~Hz, #4)} 
\newcommand{\NMRCF}[4]{#1 (#2, \JCF{}~=~#3~Hz, #4)} 
\newcommand{\NMRPF}[4]{#1 (#2, \JPF{}~=~#3~Hz, #4)} 
\newcommand{\NMRbsinglet}[2]{#1 (bs, #2)}
\newcommand{\NMRsinglet}[2]{#1 (s, #2)}
\newcommand{\NMRcoupled}[4]{#1 (#2, \J{}~=~#3~Hz, #4)} 
\newcommand{\NMRPsinglet}[1]{#1 (s)}
\newcommand{\NMRmultiplet}[2]{#1 (m, #2)}
\newcommand{\NMRdd}[4]{#1 (dd, #2, #3~Hz, #4)}
\newcommand{\NMRobscuredH}[4]{#1 (obscured, assigned by #2 correlation, #3, #4)}
\newcommand{\NMRobscuredC}[3]{#1 (obscured, assigned by #2 correlation, #3)}

% Solvents
\newcommand{\benzene}{\ce{C6D6}}

% Shortcuts for dH, dC, dN, dA, dX, dP and dF
\newcommand{\dH}{$\delta$\textsubscript{H}~}
\newcommand{\dC}{$\delta$\textsubscript{C}~}
\newcommand{\dN}{$\delta$\textsubscript{N}~}
\newcommand{\dA}{$\delta$\textsubscript{A}~}
\newcommand{\dB}{$\delta$\textsubscript{B}~}
\newcommand{\dP}{$\delta$\textsubscript{P}~}
\newcommand{\dF}{$\delta$\textsubscript{F}~}

% Shortcuts for 1H, 13C, 12C, 15N, 31P and 19F
\newcommand{\proton}{\ce{^{1}H}}
\newcommand{\carbon}{\ce{^{13}C}}
\newcommand{\nitrogen}{\ce{^{15}N}}
\newcommand{\phosphorus}{\ce{^{31}P}}
\newcommand{\carbont}{\ce{^{12}C}}
\newcommand{\fluorine}{\ce{^{19}F}}
\newcommand{\Pt}{\ce{^{195}Pt}}
\newcommand{\Agseven}{${^{107}}$Ag}
\newcommand{\Agnine}{${^{109}\mbox{Ag}}$}
\newcommand{\selenium}{\ce{^{77}Se}}
\newcommand{\Bten}{${^{10}}$B}
\newcommand{\Beleven}{${^{11}}$B}


% Shortcuts for H2, H3, H5 and H6
\newcommand{\Htwo}{H\textsubscript{2}}
\newcommand{\Hthree}{H\textsubscript{3}}
\newcommand{\Hfive}{H\textsubscript{5}}
\newcommand{\Hsix}{H\textsubscript{6}}

% Shortcuts for C1, C2, C3, C5 and C6
\newcommand{\Cone}{C\textsubscript{1}}
\newcommand{\Ctwo}{C\textsubscript{2}}
\newcommand{\Cthree}{C\textsubscript{3}}
\newcommand{\Cfive}{C\textsubscript{5}}
\newcommand{\Csix}{C\textsubscript{6}}

%Shortcut for 1J and 2J
\newcommand{\oneJ}{\mbox{\textsuperscript{1}\emph{J}}}
\newcommand{\twoJ}{\mbox{\textsuperscript{2}\emph{J}}}


%Shortcut for J
\newcommand{\J}{\mbox{\emph{J}}}

% Shortcut for 1JCH etc.
\newcommand{\oneJCH}{\mbox{\textsuperscript{1}\emph{J}\textsubscript{CH}}}
\newcommand{\oneJNH}{\mbox{\textsuperscript{1}\emph{J}\textsubscript{NH}}}
\newcommand{\oneJXH}{\mbox{\textsuperscript{1}\emph{J}\textsubscript{XH}}}
\newcommand{\oneJPtP}{\mbox{\textsuperscript{1}\emph{J}\textsubscript{PtP}}}
\newcommand{\oneJPM}{\mbox{\textsuperscript{1}\emph{J}\textsubscript{PM}}}
\newcommand{\JPSe}{\mbox{\textsuperscript{1}\emph{J}\textsubscript{PSe}}}
\newcommand{\JHH}{\mbox{\emph{J}\textsubscript{HH}}}
\newcommand{\JPH}{\mbox{\emph{J}\textsubscript{PH}}}
\newcommand{\JPC}{\mbox{\emph{J}\textsubscript{PC}}}
\newcommand{\JPF}{\mbox{\emph{J}\textsubscript{PC}}}
\newcommand{\JPtP}{\mbox{\emph{J}\textsubscript{PtP}}}
\newcommand{\JRhP}{\mbox{\emph{J}\textsubscript{RhP}}}
\newcommand{\JRhC}{\mbox{\emph{J}\textsubscript{RhC}}}
\newcommand{\JPtH}{\mbox{\emph{J}\textsubscript{PtH}}}
\newcommand{\JPtC}{\mbox{\emph{J}\textsubscript{PtC}}}
\newcommand{\JPP}{\mbox{\emph{J}\textsubscript{PP}}}
\newcommand{\JCF}{\mbox{\emph{J}\textsubscript{CF}}}
\newcommand{\JPtF}{\mbox{\emph{J}\textsubscript{PtF}}}
\newcommand{\JAgP}{\mbox{$^1\textit{J}$\textsubscript{AgP}}}
\newcommand{\JAgPseven}{\mbox{$^1\textit{J}$\textsubscript{$^{107}$AgP}}}
\newcommand{\JAgPnine}{\mbox{$^1\textit{J}$\textsubscript{$^{109}$AgP}}}


% Shortcuts for [M + H]+, [M + Na]+, [M + NH4]+, [M - H]-, [M - Na]- and [M - 2Na]2-
\newcommand{\MplusH}{\mbox{[M + H]\textsuperscript{+}}}
\newcommand{\MplusNa}{\mbox{[M + Na]\textsuperscript{+}}}
\newcommand{\MplusAmmonium}{\mbox{[M + \ce{NH4}]\textsuperscript{+}}}
\newcommand{\MminusH}{\mbox{[M $-$ H]$^{-}$}}
\newcommand{\MminusNa}{\mbox{[M $-$ Na]$^{-}$}}
\newcommand{\MminusNaNa}{\mbox{[M $-$ 2Na]\textsuperscript{2}$^{-}$}}

% Shortcuts for lambda max and nu max
\newcommand{\lambdamax}{\mbox{$\lambda$\textsubscript{max}}}
\newcommand{\numax}{\mbox{$\nu$\textsubscript{max}}}

% Shortcut for reciprocal centimetres
\newcommand{\percm}{\mbox{cm$^{-}$\textsuperscript{1}}}

% Shortcut for centimetres cubed
\newcommand{\cm}{\mbox{cm\textsuperscript{3}}}

% Shortcut for degrees C 
\newcommand{\degC}{\mbox{$\,^\circ$C}}
\newcommand{\degrees}{$^\circ$}

% Shortcuts for ED50, IC50, LC50 and LD50
\newcommand{\EDfifty}{\mbox{ED\textsubscript{50}}}
\newcommand{\ICfifty}{\mbox{IC\textsubscript{50}}}
\newcommand{\LCfifty}{\mbox{LC\textsubscript{50}}}
\newcommand{\LDfifty}{\mbox{LD\textsubscript{50}}}

% Try and limit hyphenation
\hyphenpenalty=5000
\tolerance=1000

\newcommand{\field}[1]{\textbf{#1}}	% Standard typesetting for fields
\newcommand{\entry}[1]{\textit{#1}}	% and values of database entries

\newcommand{\approximately}{ca.}

% Use a,b,c etc. for footnotes to avoid confusion with \cite
\renewcommand{\thefootnote}{$\fnsymbol{footnote}$}

\newcommand{\fixme}[1]{\colorbox[rgb]{1,0.5,0}{\textbf{#1}}}

\floatplacement{scheme}{b}
\endinput
