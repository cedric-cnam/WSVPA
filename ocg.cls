\NeedsTeXFormat{LaTeX2e}%[1995/12/01]
\ProvidesClass{ocg}[2012/02/16 v1.0]


%!!The following `article' class options should not be used,
%  so they will be ignored, for compatibility reasons:
\DeclareOption{10pt}{\AtEndOfClass{\ClassWarning{ocg}%
  {Option `10pt' ignored (default 12pt)}}}
\DeclareOption{11pt}{\AtEndOfClass{\ClassWarning{ocg}%
  {Option `11pt' ignored (default 12pt)}}}
\DeclareOption{12pt}{\AtEndOfClass{\ClassWarning{ocg}%
  {Option `12pt' ignored (default)}}}
\DeclareOption{openlib}{\AtEndOfClass{\ClassWarning{ocg}%
  {Option `openlib' ignored}}}
\DeclareOption{leqno}{\AtEndOfClass{\ClassWarning{ocg}%
  {Option `leqno' ignored}}}
\DeclareOption{fleqn}{\AtEndOfClass{\ClassWarning{ocg}%
  {Option `fleqn' ignored}}}
\DeclareOption{titlepage}{\AtEndOfClass{\ClassWarning{ocg}%
  {Option `titlepage' ignored}}}
\DeclareOption{twocolumn}{\AtEndOfClass{\ClassWarning{ocg}%
  {Option `twocolumn' ignored}}}
\DeclareOption{a4paper}{\AtEndOfClass{\ClassWarning{ocg}%
  {Option `a4paper' ignored}}}
\DeclareOption{letterpaper}{\AtEndOfClass{\ClassWarning{ocg}%
  {Option `letterpaper' ignored}}}
\DeclareOption{a5paper}{\AtEndOfClass{\ClassWarning{ocg}%
  {Option `a5paper' ignored}}}
\DeclareOption{b5paper}{\AtEndOfClass{\ClassWarning{ocg}%
  {Option `b5paper' ignored}}}
\DeclareOption{executivepaper}{\AtEndOfClass{\ClassWarning{ocg}%
  {Option `executivepaper' ignored}}}
\DeclareOption{legalpaper}{\AtEndOfClass{\ClassWarning{ocg}%
  {Option `legalpaper' ignored}}}
\DeclareOption{twoside}{\AtEndOfClass{\ClassWarning{ocg}%
  {Option `twoside' ignored (default)}}}
\DeclareOption{oneside}{\AtEndOfClass{\ClassWarning{ocg}%
  {Option `oneside' ignored (default twoside)}}}
\DeclareOption{landscape}{\AtEndOfClass{\ClassWarning{ocg}%
  {Option `landscape' ignored}}}

%!!Remaining options passed to `article' class:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,twoside]{article}%

%\usepackage[T1]{fontenc}
%\usepackage{mathptmx}
\usepackage{latexsym,amsmath,amssymb}
\usepackage{theorem}
\usepackage[bookmarks,bookmarksnumbered,naturalnames,plainpages=false]{hyperref}

\newtheorem{theorem}{Theorem}[section]
\newtheorem{definition}[theorem]{Definition}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{proposition}[theorem]{Proposition}
\newenvironment{proof}{\vspace{-2ex}{\it Proof. }}{\hspace*{\fill} $\Box$\smallskip }
\theorembodyfont{\slshape}
\newtheorem{example}[theorem]{Example}
\newtheorem{remark}[theorem]{Remark}


\setlength{\textwidth}{17cm}
\setlength{\textheight}{23cm}
\setlength{\oddsidemargin}{10mm}
\setlength{\evensidemargin}{10mm}
\setlength{\hoffset}{-15mm}
\setlength{\voffset}{-5mm}
\setlength{\headheight}{14.5pt}
\setlength{\parindent}{0pt} 
%\addtolength{\parskip}{\baselineskip}
\setlength{\parskip}{0.7\baselineskip}
\unitlength1mm

        
%%%%%%%%%%%%%%%% setdot %%%%%%%%%%%%%%%%%
\def\@seccntformat#1{\csname the#1\endcsname.\quad}
%%%%%%%%%%%%%%%%%%%%% end setdot %%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\leftmargini 25pt
\leftmarginii 22pt
\leftmarginiii 18.7pt
\leftmarginiv 17pt
\leftmarginv 10pt
\leftmarginvi 10pt
\leftmargin\leftmargini
\labelsep 5pt
\labelwidth\leftmargini\advance\labelwidth-\labelsep
\def\@listI{\leftmargin\leftmargini \parsep 2\p@ plus\p@ minus\p@
    \topsep 0\p@ plus\p@ minus2\p@
    \itemsep 1\p@ plus\p@ minus0.5\p@}
\let\@listi\@listI
\@listi
\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii\advance\labelwidth-\labelsep
   \topsep 2\p@ plus2\p@ minus\p@
   \parsep 2\p@ plus\p@ minus\p@
   \itemsep 1\p@ plus\p@ minus0.5\p@}
\def\@listiii{\leftmargin\leftmarginiii
    \labelwidth\leftmarginiii\advance\labelwidth-\labelsep
    \topsep \p@ plus\p@ minus0.5\p@
    \parsep \z@ \partopsep \p@ plus\z@ minus\p@
    \itemsep 1\p@ plus\p@ minus0.5\p@}
\def\@listiv{\leftmargin\leftmarginiv
     \labelwidth\leftmarginiv\advance\labelwidth-\labelsep}
\def\@listv{\leftmargin\leftmarginv
     \labelwidth\leftmarginv\advance\labelwidth-\labelsep}
\def\@listvi{\leftmargin\leftmarginvi
     \labelwidth\leftmarginvi\advance\labelwidth-\labelsep}


\newlength{\btlabelwidth}\setlength{\btlabelwidth}{\labelwidth}
\newlength{\btleftmargin}\setlength{\btleftmargin}{\leftmargin}
% F{\"u}r Aufz{\"a}hlungen mit Marken --
\newenvironment{btlists}{\begin{list}{{\rm--}}{%
\setlength{\labelwidth}{\btlabelwidth}\setlength{\leftmargin}{\btleftmargin}%
\setlength{\topsep}{0pt plus0.2ex}%
\setlength{\itemsep}{0ex plus0.2ex}%
\setlength{\parsep}{0pt plus0.2ex}}}{\end{list}}
%    ohne einzur{\"u}cken
\newenvironment{btlists*}{\begin{list}{{\rm--}}{%
\setlength{\labelwidth}{\btlabelwidth}\setlength{\leftmargin}{\btleftmargin}%
\addtolength{\leftmargin}{-1.3em}%
\setlength{\topsep}{0pt plus0.2ex}%
\setlength{\itemsep}{0ex plus0.2ex}%
\setlength{\parsep}{0pt plus0.2ex}}}{\end{list}}
% F{\"u}r Aufz{\"a}hlungen mit Marken (i)
\newcounter{btlistrmc}
\newenvironment{btlistrm}{\begin{list}{{\rm(\roman{btlistrmc})}}{%
\usecounter{btlistrmc}%
\setlength{\labelwidth}{\btlabelwidth}\setlength{\leftmargin}{\btleftmargin}%
\setlength{\topsep}{0pt plus0.2ex}%
\setlength{\itemsep}{0ex plus0.2ex}%
\setlength{\parsep}{0pt plus0.2ex}}}{\end{list}}
% F{\"u}r Aufz{\"a}hlungen mit Marken (a)
\newcounter{btlistklac}
\newenvironment{btlistkla}{\begin{list}{{\rm(\alph{btlistklac})}}{%
\usecounter{btlistklac}%
\setlength{\labelwidth}{\btlabelwidth}\setlength{\leftmargin}{\btleftmargin}%
\setlength{\topsep}{0pt plus0.2ex}%
\setlength{\itemsep}{0ex plus0.2ex}%
\setlength{\parsep}{0pt plus0.2ex}}}{\end{list}}
% F{\"u}r Aufz{\"a}hlungen mit Marken 1.
\newcounter{btlistic}
\newenvironment{btlisti}{\begin{list}{{\rm(\arabic{btlistic})}}{%
\usecounter{btlistic}%
\setlength{\labelwidth}{\btlabelwidth}\setlength{\leftmargin}{\btleftmargin}%
\setlength{\topsep}{0pt plus0.2ex}%
\setlength{\itemsep}{0ex plus0.2ex}%
\setlength{\parsep}{0pt plus0.2ex}}}{\end{list}}
%
\makeatletter
\newcommand{\labelbtdesi}{{\it Case \arabic{btdesi}}.}
\newcommand{\labelbtdesii}{{\it Case \arabic{btdesi}.\arabic{btdesii}}.}
\newcommand{\labelbtdesiii}{{\it Case \arabic{btdesi}.\arabic{btdesii}.\arabic{btdesiii}}.}
\newcount\@btdesdepth \@btdesdepth = 0
\@definecounter{btdesi}
\@definecounter{btdesii}
\@definecounter{btdesiii}
\def\btdes{%
  \ifnum \@btdesdepth >\tw@\@toodeep\else
    \advance\@btdesdepth\@ne
    \edef\@btdesctr{btdes\romannumeral\the\@btdesdepth}%
      \expandafter
      \list
        \csname label\@btdesctr\endcsname%
        {\usecounter\@btdesctr\def\makelabel##1{\hss\llap{##1}}%
         \setlength{\leftmargin}{1\@ptsize pt}%
         \addtolength{\leftmargin}{1\@ptsize pt}%
         \setlength{\itemindent}{5.5mm}%
         \addtolength{\itemindent}{\the\@btdesdepth mm}%
         \addtolength{\itemindent}{\the\@btdesdepth mm}%
         \addtolength{\itemindent}{\the\@btdesdepth mm}%
         \setlength{\topsep}{0pt plus0.2ex}%
         \setlength{\itemsep}{0ex plus0.2ex}%
         \setlength{\parsep}{0pt plus0.2ex}}%
  \fi}
\let\endbtdes =\endlist

\def\fnum@figure{{\small Figure~\thefigure:}}
\def\fnum@table{{\small Table~\thetable:}}
\long\def\@makecaption#1#2{
 \vskip 10pt
 \setbox\@tempboxa\hbox{\small #1 #2}
 \ifdim \wd\@tempboxa >\hsize \small #1 #2\par \else \hbox
to\hsize{\hfil\box\@tempboxa\hfil}
 \fi}

\newcommand{\d@phantom}[1]{\mbox{{#1}}}%

\newcommand{\EndOfArticle}{\clearpage\thispagestyle{empty}\cleardoublepage}

%*****************************
%!!
\renewcommand{\title}{}% {text \\of \\title}
\newcommand{\d@title}{}
\newcommand{\d@drtitle}{}
% VAR \d@title --command (global string to expand)
% VAR \d@drtitle --command (global string to expand)
%
\def\title#1{%
  \gdef\d@title{#1}\gdef\d@drtitle{#1}%
  \let\author\d@oldauthor
  \let\address\d@oldaddress
  \let\thanks\d@oldthanks
  \let\thanksmark\d@oldthanksmark
  \let\runningtitle\d@oldrunningtitle
  \let\runningauthors\d@oldrunningauthors
  \let\maketitle\d@oldmaketitle
  \def\title{\d@ahtwice}%
}
%!!clone of "\title"

%*****************************
%!!
\renewcommand{\author}{}% [list of p_labels]{name of 1 author}
\newcommand{\d@bauthor}{}\newcommand{\d@and}{}
\newcommand{\d@drauthor}{}\newcommand{\d@drand}{}
% VAR \d@bauthor{} --command (string to expand)
% VAR \d@and{}     --command (string separating authors)
% VAR \d@drauthor  --command (string to expand)
% VAR \d@drand{}    --command (string separating running authors)
%
\def\author{\@ifnextchar[{\d@dauthor}{\d@sauthor}}
%!!clone of "\author"
\def\d@bauthor{}\def\d@and{}
\def\d@drauthor{}\def\d@drand{}

\newcommand{\d@dauthor}{}%--list of p_labels present
\def\d@dauthor[#1]#2{\d@thanksmark{#1}%
  \xdef\d@bauthor{\d@bauthor\d@and\mbox{#2{}{\d@bthanksmark}}}%
  \def\d@and{\hskip 1em\@plus.17fil{}}%
  \xdef\d@drauthor{\d@drauthor\d@drand{#2}}%
  \def\d@drand{{}, }%
}

\newcommand*{\d@sauthor}[1]{%--list of p_labels missing
  \xdef\d@bauthor{\d@bauthor\d@and\mbox{#1}}%
  \def\d@and{\hskip 1em\@plus.17fil{}}%
  \xdef\d@drauthor{\d@drauthor\d@drand{#1}}%
  \def\d@drand{{}, }%
}

%*****************************
%!!
\newcommand{\address}{}% [p_label]{text //of //address}
% VAR \d@baddress,\d@temp --boxes
%
\def\address{\@ifnextchar[{\d@daddress}{\d@saddress}}
\newsavebox{\d@baddress}\newsavebox{\d@temp}
\savebox{\d@baddress}[\linewidth][t]{\centering\normalsize}

\newcommand{\d@daddress}{}%--p_label present
\def\d@daddress[#1]#2{\d@label{#1}%
  \savebox{\d@temp}[\linewidth][t]{%
    \begin{minipage}[t]{\linewidth}\centering\normalsize
      \usebox{\d@baddress}\\
      ${}^{(\d@ref{#1})}$\rule[0pt]{0pt}{3.5ex}{#2}%
    \end{minipage}%
  }%
  \savebox{\d@baddress}[\linewidth][t]{\usebox{\d@temp}}%
}

\newcommand*{\d@saddress}[1]{%--p_label missing
  \savebox{\d@temp}[\linewidth][t]{%
    \begin{minipage}[t]{\linewidth}\centering\normalsize
      \usebox{\d@baddress}\\ \rule[0pt]{0pt}{3.5ex}{#1}%
    \end{minipage}%
  }%
  \savebox{\d@baddress}[\linewidth][t]{\usebox{\d@temp}}%
}

%*****************************
%!!Auxiliary support for \address
%
\newcommand*{\withinline}{\unskip\ -- \ignorespaces}

\newcommand{\email}{}% [short author's name]{email address text}
\def\email{\@ifnextchar[{\d@demail}{\d@semail}}

\newcommand{\d@demail}{}%--short author's name present
\def\d@demail[#1]#2{\mbox{%
  \hspace*{0.5em}{\small\texttt{#2} {(#1)}}\hspace*{0.5em}%
}}

\newcommand*{\d@semail}[1]{%--short author's name missing
\mbox{\hspace*{0.5em}{\small\texttt{#1}}\hspace*{0.5em}}}

%*****************************
%!!
\renewcommand{\thanks}{}% [p_label]{text //to //footnote}
\def\thanks{\@ifnextchar[{\d@dthanks}{\d@sthanks}}
\renewcommand{\@thanks}{}\let\@thanks\relax %!!not used, cleared

\newcommand{\d@dthanks}{}%--p_label present
\long\def\d@dthanks[#1]#2{\d@label{#1}%
  \d@oldfootnotetext[0]{\hspace*{-1.8em}%
    \d@phantom{%!!
      \begin{minipage}[t]{\linewidth}\footnotesize
        \makebox[1.8em][r]{${}^{(\d@ref{#1})}$}\rule[1.7ex]{0em}{1ex}{#2}%
      \end{minipage}%
    }%!!end\d@phantom
  }%
}
%!!--space "1.8em" taken from "\def\@makefntext"

\newcommand{\d@sthanks}[1]{%--p_label missing
  \d@oldfootnotetext[0]{\hspace*{-1.8em}%
    \d@phantom{%!!
      \begin{minipage}[t]{\linewidth}\footnotesize
        \makebox[1.8em][r]{}\rule[1.7ex]{0em}{1ex}{#1}%
      \end{minipage}%
    }%!!end\d@phantom
  }%
}
%!!--space "1.8em" taken from "\def\@makefntext"

%*****************************
%!!
\newcommand{\thanksmark}{}% {list of p_labels}
\newcommand{\d@bthanksmark}{}\newcommand{\d@thanksmsep}{}
\newcommand{\d@thankslab}{}
% VAR \d@bthanksmark --command (global string to expand)
% VAR \d@thanksmsep  --command (string separating p_labels)
% VAR \d@thankslab   --command (loop control variable)
%
\def\thanksmark#1{\d@thanksmark{#1}\mbox{\d@bthanksmark}}

\newcommand*{\d@thanksmark}[1]{% {list of p_labels} => \d@bthanksmark
  \def\d@thanksmsep{}\def\d@bthanksmark{}%
  \@for\d@thankslab:=#1\do{%
    \xdef\d@bthanksmark{\d@bthanksmark\d@thanksmsep
      \d@ref{\d@thankslab}%
    }%
    \def\d@thanksmsep{,}%
  }%
  \xdef\d@bthanksmark{${}^{\scriptscriptstyle(\d@bthanksmark)}$}%
}

%*****************************
%!!
\newcommand{\runningtitle}{}% {text of running title}
\newcommand{\d@ertitle}{}\let\d@ertitle\relax
% VAR \d@ertitle --command (global string to expand)
%
\def\runningtitle#1{%
  \gdef\d@ertitle{#1}\def\runningtitle{\d@ahtwice}%
}

\newcommand{\runningauthors}{}% {text of running authors}
\newcommand{\d@erauthor}{}\let\d@erauthor\relax
% VAR \d@erauthor --command (global string to expand)
%
\def\runningauthors#1{%
  \gdef\d@erauthor{#1}\def\runningauthors{\d@ahtwice}%
}

%*****************************
%!!Auxiliary internal commands for preamble labels
%!!Counterparts of "\newlabel", "\label" and "\ref", via .aux file
%
\newcommand*{\dnewlabel}[1]{% {p_label}
\@ifundefined{c@#1}{%
  \stepcounter{footnote}\newcounter{#1}%
  \setcounter{#1}{\value{footnote}}%
}{}}
%!!--executed in .aux file, before preamble
%!!--counterpart of "\newlabel"

\newcommand*{\d@ref}[1]{% {p_label}
  \@ifundefined{c@#1}{{X}\write\@unused{ocg Class Warning:
    Preamble label `#1' undefined}}%
   {\ifnum \value{#1}=0{}\else {\Alph{#1}}\fi
  }%
}
%!!--detour by "\write", because of bug in "\@warning"
%!!--counterpart of "\ref"

\newcommand*{\d@label}[1]{% {p_label}
  \@ifundefined{c@#1}{\@warning{Preamble labels have changed^^J --
      rerun to get references right}%
    \newcounter{#1}\setcounter{#1}{24}%!!displayed as "X"
  }{}%
  \@bsphack
    \protected@write\@auxout{}{\string\dnewlabel{#1}}%
  \@esphack
}
%!!--clone of "\label"

%*****************************
%!!Auxiliary internal commands for warning messages
%
\newcommand*{\d@ahtitle}{%--warning: "ahead of \title"
  \@warning{Illegal command in preamble,}%
  \typeout{\space\space\space
    -- ocg document class prohibits some commands, until}%
  \typeout{\space\space\space\space\space\space\space\space
    \protect\title\space has been completed.}%
%  \typeout{\space\space\space
%    -- For proper formatting of the title page, see DCFS
%    documentation,}%
%  \typeout{\space\space\space\space\space\space\space\space
%    files `dcfs07dc.ps' or `dcfs07dc.pdf'.}%
}

\newcommand*{\d@ahmaketitle}{%--warning: "ahead of \maketitle"
  \@warning{Illegal command in preamble,}%
  \typeout{\space\space\space
    -- ocg document class prohibits some standard features}%
  \typeout{\space\space\space\space\space\space\space\space
    (like, e.g., standard \protect\footnote...
    handling), until}%
  \typeout{\space\space\space\space\space\space\space\space
    \protect\maketitle\space has been completed.}%
%  \typeout{\space\space\space
%    -- For proper formatting of the title page, see DCFS
%    documentation,}%
%  \typeout{\space\space\space\space\space\space\space\space
%    files `dcfs07dc.ps' or `dcfs07dc.pdf'.}%
}

\newcommand*{\d@ahtwice}{%--warning: "command used twice"
  \@warning{This ocg command cannot be used for the second
    time,^^J ignored}%
}

\newcommand*{\d@ahover}{%--warning: "below \maketitle"
  \@warning{ocg preamble command used below \protect\maketitle,}}

\newcommand*{\d@err}{%--error: "not allowed"
  \ClassError{ocg}{Some commands (\protect\and, \protect\marginpar,
    \protect\twocolumn\space ...)^^J are not allowed in ocg style,
    please fix the problem by yourself}{}%
%  {see DCFS documentation, files `dcfs07dc.ps' or `dcfs07dc.pdf'}%
}

%*****************************
%!!
\renewcommand{\maketitle}{%!!modified clone
  %\pagestyle{fancy}
  \pagestyle{myheadings}\thispagestyle{empty}%
  %\renewcommand{\headrulewidth}{0pt}%obere Trennlinie
  %\fancyhf{}\fancyhead[EL]{\thepage}\fancyhead[OR]{\thepage} 
  %\fancyhead[ER]{\sl Authors}\fancyhead[OL]{\sl Title}
  \par\begingroup
    \def\@makefnmark{\hbox to\z@{$\m@th^{\@thefnmark}$\hss}}%
    \global\@topnum\z@%!!Prevents figures from going at top of page
    \@maketitle
  \endgroup
%!!Work done, cleaning up:
  \let\ds@sub\relax
  \let\d@phantom\relax
  \def\title{\d@ahover}%
    \let\d@title\relax
    \let\d@drtitle\relax
  \def\author{\d@ahover}%
    \let\d@bauthor\relax
    \let\d@and\relax
    \let\d@drauthor\relax
    \let\d@drand\relax
    \let\d@dauthor\relax
    \let\d@sauthor\relax
    \let\d@oldauthor\relax
  \def\address{\d@ahover}%
    \savebox{\d@baddress}[0.0em][t]{}%
    \savebox{\d@temp}[0.0em][t]{}%
    \let\d@baddress\relax
    \let\d@temp\relax
    \let\d@daddress\relax
    \let\d@saddress\relax
    \let\d@oldaddress\relax
  %\def\withinline{\d@ahover} %!!Not off, on purpose!
  %\def\email{\d@ahover} %!!Not off, on purpose!
    %\let\d@demail\relax %!!Not off, on purpose!
    %\let\d@semail\relax %!!Not off, on purpose!
  \def\thanks{\d@ahover}%
    \let\d@dthanks\relax
    \let\d@sthanks\relax
    \let\d@oldthanks\relax
  \def\thanksmark{\d@ahover}%
    \let\d@bthanksmark\relax
    \let\d@thanksmsep\relax
    \let\d@thankslab\relax
    \let\d@thanksmark\relax
    \let\d@oldthanksmark\relax
  \def\runningtitle{\d@ahover}%
    \let\d@ertitle\relax
    \let\d@oldrunningtitle\relax
  \def\runningauthors{\d@ahover}%
    \let\d@erauthor\relax
    \let\d@oldrunningauthors\relax
  \let\d@ref\relax
  \let\d@label\relax
  \let\d@ahtitle\relax
  \gdef\d@ahmaketitle{}%
  \let\d@ahtwice\relax
  \let\@maketitle\relax
    \let\d@rbannr\relax
    \let\d@lbannr\relax
    \let\d@oldll\relax
    \let\d@oldnewline\relax
    \let\d@oldlinebreak\relax
  \let\d@oldmaketitle\relax
  %\let\dpagerange\relax %!!Not off, on purpose!
    %\let\c@dlastpage\relax %!!Not off, on purpose!
  \let\footnote\d@oldfootnote
  \let\footnotemark\d@oldfootnotemark
  \let\footnotetext\d@oldfootnotetext
  \let\d@oldfootnote\relax
  \let\d@oldfootnotemark\relax
  \let\d@oldfootnotetext\relax
  \def\thefootnote{\arabic{footnote}}%
  \setcounter{footnote}{0}%
  \renewcommand*{\pagestyle}[1]{}% %!!\thispagestyle allowed
  \renewcommand{\markright}[1]{}%
  \renewcommand{\markboth}[2]{}%
  \typeout{\space\space\space\space...done}%
  \def\maketitle{\d@ahover}%
}
%!!clone of "\maketitle"

  \newcommand*{\d@rbannr}{%
%    Descriptional Complexity of Formal Systems\\
%    $\!\!\!$(Draft)\hfill
%    Deadline for submissions: April 25, 2010\\
%    Final versions: July 8, 2010%
  }%

\newcommand*{\d@lbannr}{%
%  \begin{minipage}[t]{0em}\flushleft\huge\itshape
%    \makebox[0em][l]{$\mathcal{D}\!\mathcal{C}\!\!%
%      \mathcal{F}\!\!\mathcal{S}$}\\[-1.2ex]%
%    \makebox[0em][l]{\itshape\,\,\,\,2$\!$0$\!$1$\!$0}%
%  \end{minipage}%
}

\renewcommand{\@maketitle}{%!!modified clone
  \typeout{ocg: Building title page...}%
  \newpage\null\mbox{}\vspace*{-25mm}\par%
%    \begin{minipage}[t]{0.09\linewidth}\flushleft\scriptsize
%      \d@lbannr\hspace*{0.13em}%
%      \raisebox{-0.33ex}[0ex][0ex]{\d@lbannr}%
%    \end{minipage}\hfill
%    \begin{minipage}[t]{0.88\linewidth}\flushright\scriptsize
%      \mbox{}\\[-5.4ex]\d@rbannr
%    \end{minipage}\\
%    \mbox{}\vspace{1.0ex}\par
 \noindent
 \mbox{}\vspace{1.0ex}\par
  \begin{center}%
    \def\thanksmark##1{\@@warning{thanksmark in illegal
        location !!!}[!!!!
        $\backslash$thanksmark in illegal location !!!!]}%
      %!!set up running title and running author(s):
      %!!turn off "\\", "\newline", "\linebreak":
        \let\d@oldll\\ \def\\{\unskip\ \ignorespaces}%
        \let\d@oldnewline\newline
          \def\newline{\unskip\ \ignorespaces}%
        \let\d@oldlinebreak\linebreak
          \def\linebreak{\unskip\ \ignorespaces}%
        \typeout{ocg: Preparing title and author(s) for running
          headlines...}%
        \@ifundefined{d@ertitle}{}{\xdef\d@drtitle{\d@ertitle}}%
        \@ifundefined{d@erauthor}{}{\gdef\d@drauthor{\d@erauthor}}%
        \xdef\btauthor{\d@drauthor}\xdef\bttitle{\d@drtitle}
        %\fancyhead[ER]{\sl\btauthor}\fancyhead[OL]{\sl\bttitle}
        \markboth{\sl\btauthor}{\sl\bttitle}
        %!!testing correctness of running author(s) and running title:
        \sbox{\d@temp}{\d@drauthor}\sbox{\d@temp}{\d@drtitle}%
      %!!turn on "\\", "\newline", "\linebreak":
      \let\\\d@oldll
        \let\newline\d@oldnewline \let\linebreak\d@oldlinebreak
      \typeout{ocg: Preparing title for the first page...}%
      {\LARGE\bfseries \d@title\\ \mbox{}}\par
      \typeout{ocg: Preparing author(s) for the first page...}%
      \d@phantom{%!!
        \begin{minipage}[t]{0.9\linewidth}\centering\LARGE
          \d@bauthor{}\mbox{}\\[-1.3ex]%
          \mbox{}%
        \end{minipage}%
      }%!!end\d@phantom
    \let\thanksmark\d@oldthanksmark
    \vspace{-6mm}\par
    \typeout{ocg: Preparing addresses...}%
    \d@phantom{%!!
      \usebox{\d@baddress}%
    }%!!end\d@phantom
  \end{center}%
  \mbox{}\par
}
%!!clone of "\@maketitle"

%%*****************************
%%!!Small extensions to the standard article
%%!!(except for preamble and theorem-like environments)
%%
\renewenvironment{abstract}{%
  \@ifundefined{@maketitle}{}{\d@ahmaketitle}%
    {\itshape\bfseries \abstractname}\newline\itshape}%
{\unskip\ignorespaces}
%
%\newcommand*{\keywords}{\unskip\mbox{}\\ \mbox{}\\
%  {\bfseries Keywords:}\hspace{\labelsep}\ignorespaces}
%
%\newcommand*{\PCappendix}{\clearpage
%  \section*{Appendix for the Program Committee}\appendix
%  \renewcommand*{\thepage}{A\,-\,\arabic{page}}%
%}
\newcommand\biblio[1]{\bibliographystyle{ocg}\pdfbookmark{\refname}{\refname}
{\small\bibliography{#1}}}

%*****************************
%!!Global initial declarations
%
%!!just for using the fact that \roman{0}=blank :
\renewcommand*{\thefootnote}{\roman{footnote}}
\setcounter{footnote}{0}

\newcommand*{\d@oldll}{}
\newcommand*{\d@oldnewline}{}
\newcommand*{\d@oldlinebreak}{}
\newcommand*{\d@oldauthor}{}
\newcommand*{\d@oldaddress}{}
\newcommand*{\d@oldthanks}{}
\newcommand*{\d@oldthanksmark}{}
\newcommand*{\d@oldrunningtitle}{}
\newcommand*{\d@oldrunningauthors}{}
\newcommand*{\d@oldmaketitle}{}
\newcommand*{\d@oldfootnote}{}
\newcommand*{\d@oldfootnotemark}{}
\newcommand*{\d@oldfootnotetext}{}

\let\d@oldauthor\author
\let\d@oldaddress\address
\let\d@oldthanks\thanks
\let\d@oldthanksmark\thanksmark
\let\d@oldrunningtitle\runningtitle
\let\d@oldrunningauthors\runningauthors
\let\d@oldmaketitle\maketitle
\let\d@oldfootnote\footnote
\let\d@oldfootnotemark\footnotemark
\let\d@oldfootnotetext\footnotetext

\def\author{\d@ahtitle}
\def\address{\d@ahtitle}
\def\thanks{\d@ahtitle}
\def\thanksmark{\d@ahtitle}
\def\runningtitle{\d@ahtitle}
\def\runningauthors{\d@ahtitle}
\def\maketitle{\d@ahtitle}
\def\footnote{\d@ahmaketitle}
\def\footnotemark{\d@ahmaketitle}
\def\footnotetext{\d@ahmaketitle}


\makeatother
\DeclareSymbolFont{letters}{OML}{cmm}{m}{it}
\DeclareSymbolFont{symbols}{OMS}{cmsy}{m}{n}
\arraycolsep0.15em
\date{}

