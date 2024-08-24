%%
%% This is file `wber.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% classes.dtx  (with options: `wber')
%% 
%% This is a generated file.
%% 
%% Copyright 2019 Aptara India
%% The LaTeX3 Project and any individual authors listed elsewhere
%% in this file.
%% 
%% This file was generated from file(s) of the LaTeX base system.
%% --------------------------------------------------------------
%% 
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2003/12/01 or later.
%% 
%% This file has the LPPL maintenance status "maintained".
%% 
%% This file may only be distributed together with a copy of the LaTeX
%% base system. You may however distribute the LaTeX base system without
%% such generated files.
%% 
%% The list of all files belonging to the LaTeX base distribution is
%% given in the file `manifest.txt'. See also `legal.txt' for additional
%% information.
%% 
%% The list of derived (unpacked) files belonging to the distribution
%% and covered by LPPL is defined by the unpacking scripts (with
%% extension .ins) which are part of the distribution.
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{wber}
              [2019/08/13 v1.0f
 Standard LaTeX document class]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\ExecuteOptions{letterpaper,10pt,oneside,onecolumn,final}
\ProcessOptions
%\input{size1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\def\ps@headings{%
   \def\@evenhead{\vbox{\hsize\textwidth%
      {\evenfolio}\hfill{\rhhfont{\rightmark}}\par\vspace*{7pt}
      {\vrule width\textwidth height1pt}}}%
   \def\@oddhead{\vbox{\hsize\textwidth%
      {\rhhfont{The World Bank Economic Review}\hfill{\oddfolio}\par\vspace*{7pt}
      {\vrule width\textwidth height1pt}}}}%%%
   \def\@oddfoot{}%
   \def\@evenfoot{}%  
   \let\@mkboth\@gobbletwo}
%%
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
    }
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\textsuperscript{{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent0pt
            \hb@xt@1.8em{%
                {\normalfont\@thefnmark}\hfill}##1}%
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
      \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
 \bgroup\parindent0pt
  \vskip 26.5pt%
  {\vrule width\textwidth height2pt depth0pt}\par\vskip.5pt%
  \let \footnote \thanks
  {\titlefont \@title \par}%
    \vskip 9pt%
    {\authorfont\@author\par\vskip2pt}%
    \footnotetext{\protect\@affil}%
    \ifx\@abstract\@empty\else\vskip10pt{\abstractfont\@abstract\par}\fi%
    \ifx\@jelcode\@empty\else\vskip6pt{\abstractfont{\bfseries JEL classification:\space}\@jelcode\par}\fi%
    \ifx\@keywords\@empty\else\vskip9pt{\abstractfont{\bfseries Keywords:\space}\@keywords\par}\vskip4pt\fi%
    {\vrule width\textwidth height2pt depth0pt}\par%
  \egroup
  \vskip 1.5em}
%%
\setcounter{secnumdepth}{1}
\def\@seccntformat#1{\csname the#1\endcsname\hspace*{4.5pt}}
\newcounter {part}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thesection {\@arabic\c@section.}
\renewcommand\thesubsection   {\thesection\@arabic\c@subsection.}
\renewcommand\thesubsubsection{\thesubsection\@arabic\c@subsubsection.}
\renewcommand\theparagraph    {\thesubsubsection\@arabic\c@paragraph.}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\part{%
   \if@noskipsec \leavevmode \fi
   \par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >\m@ne
       \Large\bfseries \partname\nobreakspace\thepart
       \par\nobreak
     \fi
     \huge \bfseries #2%
     \markboth{}{}\par}%
    \nobreak
    \vskip 3ex
    \@afterheading}
\def\@spart#1{%
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \huge \bfseries #1\par}%
     \nobreak
     \vskip 3ex
     \@afterheading}
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-20.5pt \@plus -1pt \@minus -.5pt}%
                                   {4.5pt}%
                                   {\sectionfont}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-12.5pt \@plus -1pt \@minus -.5pt}%
                                     {0.00001pt}%
                                     {\subsectionfont}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-12.5pt \@plus -1pt \@minus -.5pt}%
                                     {0.0001pt}%
                                     {\subsubsectionfont}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {-12.5pt \@plus -1pt \@minus -.5pt}%%
                                    {-1em}%
                                    {\paragraphfont}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\subparagraphfont}}
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8.}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}

\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\if@titlepage
  \newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{abstract}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \small
        \begin{center}%
          {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\newcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \gdef\thesection{\@Alph\c@section}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand \theequation {\@arabic\c@equation}
\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\def\@captype{figure}\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\def\@captype{figure}\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\def\@captype{table}\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\def\@captype{table}\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{13.5\p@}
\def\FigName{figure}
\long\def\@makecaption#1#2{%
 \ifx\FigName\@captype%
    {\figcapfont{\bfseries#1.}\space#2\par}%
     \vskip\belowcaptionskip%
 \else%
    {\tablecapfont{\bfseries#1.}\space#2\par}
 \fi}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\newcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
       \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
      \fi
    \endgroup
  \fi}
\newcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
    \section*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\section*{\refname}\bibfont%
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\section*{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{}
\def\@makefnmark{\textsuperscript{{\normalfont\@thefnmark}}}%
\newskip\@footmax
\def\footmax#1{%
  \setbox0\hbox{#1}%
  \global\@footmax\wd0}
\footmax{1}
\newcommand\@makefntext[1]{%
    \parindent0pt%
    \noindent
    \advance\@footmax by 8.5pt%
    \leavevmode\@hangfrom{\hbox to \@footmax{\@makefnmark\hfill}}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
%%%%%%%%%%%%%%%%%% Aptara Corp %%%%%%%%%%%%
\def\@ixhpt{9.5}
\def\@xiihpt{12.5}

\renewcommand\normalsize{%
   \@setfontsize\normalsize\@ixhpt\@xiihpt
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\newcommand\small{%
   \@setfontsize\small\@ixpt{11}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\footnotesize{%
   \@setfontsize\footnotesize\@viiipt{11}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\newcommand\large{\@setfontsize\large\@xiipt{14}}
\newcommand\Large{\@setfontsize\Large\@xivpt{18}}
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
\setlength\parindent{12\p@}
\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
\setlength\headheight{12\p@}
\setlength\headsep   {14\p@}
\setlength\topskip   {10\p@}
\setlength\footskip{22\p@}
\if@compatibility \setlength\maxdepth{4\p@} \else
\setlength\maxdepth{.5\topskip} \fi
\if@compatibility
  \if@twocolumn
    \setlength\textwidth{410\p@}
  \else
    \setlength\textwidth{345\p@}
  \fi
\else
  \setlength\@tempdima{\paperwidth}
  \addtolength\@tempdima{-2in}
  \setlength\@tempdimb{345\p@}
  \if@twocolumn
    \ifdim\@tempdima>2\@tempdimb\relax
      \setlength\textwidth{2\@tempdimb}
    \else
      \setlength\textwidth{\@tempdima}
    \fi
  \else
    \ifdim\@tempdima>\@tempdimb\relax
      \setlength\textwidth{\@tempdimb}
    \else
      \setlength\textwidth{\@tempdima}
    \fi
  \fi
\fi
\if@compatibility\else
  \@settopoint\textwidth
\fi
\if@compatibility
  \setlength\textheight{43\baselineskip}
\else
  \setlength\@tempdima{\paperheight}
  \addtolength\@tempdima{-2in}
  \addtolength\@tempdima{-1.5in}
  \divide\@tempdima\baselineskip
  \@tempcnta=\@tempdima
  \setlength\textheight{\@tempcnta\baselineskip}
\fi
\addtolength\textheight{\topskip}
\if@twocolumn
 \setlength\marginparsep {10\p@}
\else
  \setlength\marginparsep{11\p@}
\fi
\setlength\marginparpush{5\p@}
\if@compatibility
  \if@twoside
     \setlength\oddsidemargin   {44\p@}
     \setlength\evensidemargin  {82\p@}
     \setlength\marginparwidth {107\p@}
  \else
     \setlength\oddsidemargin   {63\p@}
     \setlength\evensidemargin  {63\p@}
     \setlength\marginparwidth  {90\p@}
  \fi
  \if@twocolumn
     \setlength\oddsidemargin  {30\p@}
     \setlength\evensidemargin {30\p@}
     \setlength\marginparwidth {48\p@}
  \fi
\else
  \if@twoside
    \setlength\@tempdima        {\paperwidth}
    \addtolength\@tempdima      {-\textwidth}
    \setlength\oddsidemargin    {.4\@tempdima}
    \addtolength\oddsidemargin  {-1in}
    \setlength\marginparwidth   {.6\@tempdima}
    \addtolength\marginparwidth {-\marginparsep}
    \addtolength\marginparwidth {-0.4in}
  \else
    \setlength\@tempdima        {\paperwidth}
    \addtolength\@tempdima      {-\textwidth}
    \setlength\oddsidemargin    {.5\@tempdima}
    \addtolength\oddsidemargin  {-1in}
    \setlength\marginparwidth   {.5\@tempdima}
    \addtolength\marginparwidth {-\marginparsep}
    \addtolength\marginparwidth {-0.4in}
    \addtolength\marginparwidth {-.4in}
  \fi
  \ifdim \marginparwidth >2in
     \setlength\marginparwidth{2in}
  \fi
  \@settopoint\oddsidemargin
  \@settopoint\marginparwidth
  \setlength\evensidemargin  {\paperwidth}
  \addtolength\evensidemargin{-2in}
  \addtolength\evensidemargin{-\textwidth}
  \addtolength\evensidemargin{-\oddsidemargin}
  \@settopoint\evensidemargin
\fi
\if@compatibility
  \setlength\topmargin{27pt}
\else
  \setlength\topmargin{\paperheight}
  \addtolength\topmargin{-2in}
  \addtolength\topmargin{-\headheight}
  \addtolength\topmargin{-\headsep}
  \addtolength\topmargin{-\textheight}
  \addtolength\topmargin{-\footskip}     % this might be wrong!
  \addtolength\topmargin{-.5\topmargin}
  \@settopoint\topmargin
\fi
\setlength\footnotesep{6.65\p@}
\setlength{\skip\footins}{12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\floatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep   {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}
\def\@listi{\leftmargin\leftmargini
            \parsep 4\p@ \@plus2\p@ \@minus\p@
            \topsep 8\p@ \@plus2\p@ \@minus4\p@
            \itemsep4\p@ \@plus2\p@ \@minus\p@}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    4\p@ \@plus2\p@ \@minus\p@
              \parsep    2\p@ \@plus\p@  \@minus\p@
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep   \topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}
%%
\global\setlength\paperwidth{8.5in}
\global\setlength\paperheight{11in}

\newdimen\typeheight\typeheight53pc%
\newdimen\typewidth\typewidth35.5pc%44pc%
\global\setlength\textheight{51pc}
\global\setlength\textwidth{35.5pc}

\global\topmargin69pt
\oddsidemargin85.5pt%3.6pc
\evensidemargin85.5pt

\setlength\headheight{0\p@}% 
\setlength\headsep   {26pt}% \typeheight - \textheight - \headheight
\setlength\topskip   {0\p@}
\setlength\splittopskip   {\topskip}
\addtolength\textheight{4pt}
%
% COLORS DEFINITIONS
%
%%
%\parskip5.75pt
%\raggedright%
\voffset-6.75pc
\hoffset-5.3pc
%%
\renewcommand{\sfdefault}{phv}
\renewcommand{\rmdefault}{ptm}
%%
\def\@outputpage{%
\begingroup           % the \endgroup is put in by \aftergroup
  \let \protect \noexpand
  \@resetactivechars
  \global\let\@@if@newlist\if@newlist
  \global\@newlistfalse
  \@parboxrestore
  \shipout \vbox{%
    \set@typeset@protect
    \aftergroup \endgroup
    \aftergroup \set@typeset@protect
                                % correct? or just restore by ending
                                % the group?
  \if@specialpage
    \global\@specialpagefalse\@nameuse{ps@\@specialstyle}%
  \fi
%%  \if@twoside
    \ifodd\count\z@ \let\@thehead\@oddhead \let\@thefoot\@oddfoot
         \let\@themargin\oddsidemargin
    \else \let\@thehead\@evenhead
       \let\@thefoot\@evenfoot \let\@themargin\evensidemargin
    \fi
 %% \fi
  \reset@font
  \normalsize
  \normalsfcodes
  \let\label\@gobble
  \let\index\@gobble
  \let\glossary\@gobble
  \baselineskip\z@skip \lineskip\z@skip \lineskiplimit\z@
    \@begindvi
    \vskip \topmargin
    \moveright\@themargin \vbox {%
      \setbox\@tempboxa \vbox to\headheight{%
        \vfil
        \color@hbox
          \normalcolor
          \hb@xt@\textwidth{\@thehead}%
        \color@endbox
        }%                        %% 22 Feb 87
      \dp\@tempboxa \z@
      \box\@tempboxa
      \vskip \headsep
      \box\@outputbox
      \baselineskip \footskip
      \color@hbox
        \normalcolor
        \hb@xt@\textwidth{\@thefoot}%
      \color@endbox
      }%
    }%
  \global\let\if@newlist\@@if@newlist
  \global \@colht \textheight
  \stepcounter{page}%
  \let\firstmark\botmark
}
%%
\pagestyle{headings}
%%
\def\foliofont{\fontfamily{\sfdefault}\fontsize{8}{10}\selectfont}
\def\rhfont{\fontfamily{\sfdefault}\fontsize{8}{12}\selectfont\raggedleft}
\def\titlefont{\fontfamily{\rmdefault}\fontsize{18}{24}\selectfont\bfseries\rightskip0pc plus1fill}
\def\authorfont{\fontfamily{\sfdefault}\fontsize{12}{15}\selectfont\bfseries\rightskip6pc plus1fill}%
\def\affilfont{\reset@font\fontfamily{\rmdefault}\fontsize{8}{11}\selectfont}%
\def\corfont{\reset@font\fontfamily{\sfdefault}\fontsize{8.5}{12}\selectfont\rightskip6pc plus1fill}%
\def\historyfont{\reset@font\fontfamily{\sfdefault}\fontsize{7}{10}\selectfont\rightskip6pc plus1fill}%
\def\abstractfont{\fontfamily{\rmdefault}\fontsize{9}{12}\selectfont}
\def\absheadfont{\fontfamily{\sfdefault}\fontsize{10}{12}\selectfont\bfseries}
\def\keywordfont{\fontfamily{\rmdefault}\fontsize{9}{12}\selectfont\rightskip6pc}
\def\abstractheadfont{\fontfamily{\sfdefault}\fontsize{10}{12}\selectfont\bfseries}
\def\keywordheadfont{\fontfamily{\sfdefault}\fontsize{9}{12}\selectfont\bfseries}
\def\rffont{\fontfamily{\sfdefault}\fontsize{7}{10}\selectfont}
\def\rhhfont{\fontfamily{\sfdefault}\fontsize{8}{10}\selectfont}
\def\fignotefont{\fontfamily{\rmdefault}\fontsize{6}{9}\selectfont}
\def\bibliofont{\fontfamily{\rmdefault}\fontsize{8.5}{11.5}\selectfont}
%%
\def\sectionfont{\fontfamily{\sfdefault}\fontsize{10}{12.5}\selectfont\bfseries\rightskip0pt plus1fill}
\def\subsectionfont{\fontfamily{\sfdefault}\fontsize{9}{12.5}\selectfont\rightskip0pt plus1fill}
\def\subsubsectionfont{\fontsize{9.5}{12.5}\selectfont\bfseries}
\def\paragraphfont{\fontsize{9.5}{12.5}\selectfont\itshape}%
\def\subparagraphfont{\fontfamily{\sfdefault}\fontsize{9.5}{12.5}\selectfont}%
%%
\def\figcapfont{\fontfamily{\sfdefault}\fontsize{7}{10}\selectfont}
\def\tablecapfont{\fontfamily{\sfdefault}\fontsize{7.5}{10.5}\selectfont}
\def\tablefont{\fontfamily{\rmdefault}\fontsize{7.5}{10.5}\selectfont}
%%
\def\keywords#1{\gdef\@keywords{#1}}\keywords{}
\def\jelcode#1{\gdef\@jelcode{#1}}\jelcode{}
%%
\def\tnotemark#1{\textsuperscript{#1}}%%
%%
\newenvironment{tablenotes}{\list{}{\setlength{\labelsep}{0pt}% 
\setlength{\labelwidth}{0pt}%
\setlength{\leftmargin}{0pt}%
\setlength{\rightmargin}{0pt}%
\setlength{\topsep}{.5pt}%
\setlength{\itemsep}{0pt}%
\setlength{\partopsep}{0pt}%
\setlength{\listparindent}{0em}%
\setlength{\parsep}{0pt}}%
\item\relax\fignotefont%
}{\endlist}%
%%
\def\tnote#1{\par\textsuperscript{#1}}
%%
\setlength\parindent{12\p@}%
\def\abstract#1{\gdef\@abstract{#1}}
%%
\renewcommand\abstract[2][]{%
  \gdef\@abstract{%
    \setlength{\parindent}{\z@}%
    {\reset@font\absheadfont#1}\par\vskip3.75pt% LN20feb2016
    {\abstractfont#2\par\vspace*{0\p@}}%
  }}%
%%
\def\endpage#1{\gdef\@endpage{#1}}\endpage{0}
\AtEndDocument{\immediate\write\@mainaux{\string\endpage{\thepage}}%
\immediate\write\@mainaux{\string\footmax{\thefootnote}}}%
\def\title#1{\gdef\@title{#1}}\title{}
\def\dhead#1{\gdef\@dhead{#1}}\dhead{}
\def\jvol#1{\gdef\@jvol{#1}}\jvol{}
\def\jnum#1{\gdef\@jnum{#1}}\jnum{}
\def\doi#1{\gdef\@doi{#1}}\doi{}
\def\jyear#1{\gdef\@jyear{#1}}\jyear{}
\newcount\affcnt
\def\affil#1{%
\global\advance\affcnt\@ne%
\expandafter\gdef\csname aff\romannumeral\the\affcnt\endcsname{#1}%
}
\newcount\authorcount
\def\author#1{\global\advance\authorcount\@ne%
\expandafter\gdef\csname author\romannumeral\the\authorcount\endcsname{#1}%
}
%%
\newcount\tempcount
\newcount\tempacount
%%
\def\@affil{%
  \ifnum\affcnt>\z@%
    \tempcount\z@%
    \loop%
       \ifnum\affcnt>\z@%
       \advance\tempcount\@ne%
        {\parindent0pt\csname aff\romannumeral\the\tempcount\endcsname.\space}%
        \advance\affcnt\m@ne%
    \repeat%
  \fi%
}
\def\@author{%
  \ifnum\authorcount>\z@%
    \tempcount\z@%
    \tempacount=\authorcount%
    \loop%
    \ifnum\tempacount>\z@%
     \advance\tempcount\@ne%
      \noindent\csname author\romannumeral\the\tempcount\endcsname%
      \ifnum\authorcount=\tw@%
          \ifnum\tempacount=\@ne\else\space and\space\fi%
      \else%
        \ifnum\tempacount=\tw@%
           \unskip,\space and\space%
        \else%
           \ifnum\tempacount=\@ne\else\unskip,\space\fi% 
        \fi%
      \fi%
    \advance\tempacount\m@ne%
  \repeat%
\fi%
}
%%
%%
%%
\def\ps@plain{%
   \def\@oddhead{\hbox to \textwidth{\hfill\vbox to 54pt{\hsize250pt\vfill{\raggedleft\rhfont{\itshape The World Bank Economic Review},\ \@jvol(\@jnum),\ \@jyear,\ \thepage--\@endpage\par%
doi:\ \@doi\par\@dhead\par}\vfill}\hspace*{1.5pc}\vbox to 54pt{\hsize46pt{\special{color push gray .50}\vrule width46pt height54pt depth0pt\special{color pop}}}}}%
   \let\@evenhead\@oddhead
   \def\@oddfoot{\hbox to \textwidth{%
     \vbox to 5pt{{\hsize\textwidth{\rffont\copyright\  The Author(s)\ \@jyear.\ Published by Oxford University Press on behalf of the International Bank for Reconstruction and Development/\,{\scshape the world bank}. All rights reserved. For permission, please e-mail: journals.permissions@oup.com \par}}}}}%
   \def\@evenfoot{}%
   \let\@mkboth\@gobbletwo}
%%
\def\oddfolio{{\foliofont\thepage}}
\def\evenfolio{{\foliofont\thepage}}
%%
\def\@listi{%
   \leftmargin\leftmargini
   \labelwidth\leftmargini
   \advance\labelwidth-\labelsep
   \parsep   \z@ \@plus \p@
   \topsep  .5\baselineskip \@plus \p@ \@minus \p@
   \itemsep  \z@ \@plus \p@ \@minus \p@}
\let\@listI\@listi
\@listi
\def\@listii{%
   \leftmargin\leftmarginii
   \labelwidth\leftmarginii
   \advance\labelwidth-\labelsep
   \topsep  .5\baselineskip \@plus \p@ \@minus \p@
   \parsep   \z@ \@plus \p@
   \itemsep  \parsep}
\def\@listiii{%
   \leftmargin\leftmarginiii
   \labelwidth\leftmarginiii
   \advance\labelwidth-\labelsep
   \topsep     \z@ \@plus \p@ \@minus \p@
   \parsep     \z@ \@plus \p@
   \partopsep  \z@ \@plus \z@ \@minus \p@
   \itemsep    \topsep}
\def\@listiv{%
   \leftmargin\leftmarginiv
   \labelwidth\leftmarginiv
   \advance\labelwidth-\labelsep}
\def\@listv{%
   \leftmargin\leftmarginv
   \labelwidth\leftmarginv
   \advance\labelwidth-\labelsep}
\def\@listvi{%
   \leftmargin\leftmarginvi
   \labelwidth\leftmarginvi
   \advance\labelwidth-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\partopsep         \z@ \@plus 1\p@ \@minus 1\p@
\leftmargini     25\p@
\leftmarginii    22\p@
\leftmarginiii   13\p@
\leftmarginiv    17\p@
\leftmarginv     10\p@
\leftmarginvi    10\p@
\leftmargin\leftmargini
\labelsep         5\p@
\labelwidth\leftmargini
\advance\labelwidth-\labelsep
%
\def\itemize{\setlength\leftmargini{1em}\labelsep5pt%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\setlength\leftmarginii{1.1em}\itemsep0pt\ifnum \@listdepth >1\topsep0pt\else\topsep4.5pt\fi\parsep0pt\parskip0pt\def\makelabel##1{\hss\llap{##1}}}%
  \fi}
%%
\def\enumerate{\setlength\leftmargini{1.25em}%
  \ifnum \@enumdepth >\thr@@\@toodeep\else
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
      \expandafter
      \list
        \csname label\@enumctr\endcsname
        {\setlength\leftmarginii{1.7em}\itemsep0pt\ifnum \@listdepth >1\topsep0pt\else\topsep4.5pt\fi\parsep0pt\parskip0pt\usecounter\@enumctr\def\makelabel##1{\hss\llap{##1}}}%
  \fi}
%%
\newenvironment{unnumlist}{\list{}{\itemsep0pt\parsep0pt\parskip0pt\partopsep0pt\leftmargin4mm\itemindent-4mm}}{\endlist}%
%%% itemize/enumerate
\def\theenumi{\@arabic\c@enumi}
\def\labelenumi{\theenumi.}
\def\theenumii{\@alph\c@enumii}
\def\labelenumii{(\theenumii)}
\def\p@enumii{\theenumi}
\def\theenumiii{\@roman\c@enumiii}
\def\labelenumiii{\theenumiii.}
\def\p@enumiii{\theenumi(\theenumii)}
\def\theenumiv{\@Alph\c@enumiv}
\def\labelenumiv{\theenumiv.}
\def\p@enumiv{\p@enumiii\theenumiii}
\def\labelitemi{\textbullet}
\def\labelitemii{\normalfont\bfseries \textendash}
\def\labelitemiii{\textasteriskcentered}
\def\labelitemiv{\textperiodcentered}
%%
\def\figuresource#1{\par\vspace*{6pt}{\fignotefont{\it Source}:\ #1\par}}
\def\figurenote#1{{\fignotefont{\it Note}:\ #1\par}}
%%
\def\Hline{%
  \noalign{\ifnum0=`}\fi\hrule \@height .5pt \futurelet%\@height \arrayrulewidth
   \@tempa\@xhline}
%%
\def\toprule{\\[-7pt]\hline\\[-6.6pt]}
\def\colrule{\\[-7.5pt]\hline\\[-7.2pt]}
\def\botrule{\\[-7.5pt]\hline}
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Bibliography Section   %%%%%%%%%%%%%%%%%%
%
\newdimen\bibindent
\newdimen\bibleftmargin
\newdimen\bibitemsep
\newdimen\bibparsep
\newdimen\bibtext
\newdimen\biblabelsep
\newdimen\bibleftmargini
%
%%%%% TRUE FOR CHAPTER TITLE AND FALSE FOR SECTION TITLE %%%%%%%%
\newif\ifbibchapter
\global\bibchaptertrue
%%%%%%%% Unnumberd References %%%%%%%%%%%
\setlength\bibleftmargin  {10pt}
\setlength\bibitemsep  {0pt}
\setlength\bibparsep  {0pt}
%%%%%%%% Numbered Within Squre Bracket %%%%%%%%%%%
\newif\ifnumsqure
\global\numsqurefalse
\setlength\biblabelsep  {10pt}
\setlength\bibleftmargini  {5.75pt}
%%%%%%%% Numbered With Dot %%%%%%%%%%%%%%%
\setlength\bibtext  {18pt}
%
\AtBeginDocument{%
\renewenvironment{thebibliography}[1]
     {\bibliofont%
    \section*{\refname}%
%     \markright{\bibname}
     \def\@tempa{#1}%
     \ifx\@tempa\@empty
	\list{}%
           {\labelwidth0pt\labelsep0pt
           \leftmargin\bibleftmargin%12
           \itemindent-\bibleftmargin
           \itemsep\bibitemsep
           \parsep\bibparsep
           \usecounter{enumiv}%
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\arabic{enumiv}}}%
      \else
          \setbox\tempbox\hbox{\@tempa.}
          \tempdimen\wd\tempbox
          \ifnumsqure
          \else
          \def\@biblabel##1{{\hbox to \tempdimen{##1.}}}\fi%
           \list{\@biblabel{\arabic{enumiv}}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
           \leftmargin\labelsep
%           \advance\leftmargin\bibtext
               \advance\leftmargin\labelwidth
%          \ifnumsqure
%               \advance\leftmargin\labelwidth
%              \fi
           \itemindent0pt
           \itemsep\bibitemsep
           \parsep\bibparsep
           \usecounter{enumiv}%
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\arabic{enumiv}}}%
     \fi
     \sloppy\clubpenalty4000\widowpenalty4000%
     \sfcode`\.=\@m\par}
     {\def\@noitemerr
     {\@latex@warning{Empty `thebibliography' environment}}%
     \endlist}
\renewcommand\newblock{}
}
%%
\global\let\bibfont\bibliofont
%%
\DeclareRobustCommand{\BibTeX}{B\kern-.01em%
        {\sbox\z@ B%
         \vbox to\ht\z@{\vss\hbox{\check@mathfonts
                              \fontsize\sf@size\z@
                              \math@fontsfalse\selectfont
                              IB}%
                        }%
        }%
        \kern-.05em%
        \TeX}
%%
\endinput
%%
%% End of file `wber.cls'.
