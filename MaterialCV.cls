
%----------------------------------------------------------------------------------------
%	CLASS DEFINITION AND PARAMETERS
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\newcommand{\classname}{MaterialCV}
\providecommand{\baseclass}{article}
\LoadClass{article}
\ProvidesClass{\classname}[2016/02/25 v1.0]

%===== для компиляции XeTeX =======
\RequirePackage{fontspec}

%===== для компиляции pdfLaTeX ====
%\RequirePackage[utf8]{inputenc}
%\RequirePackage[T2A]{fontenc}
%\RequirePackage[english,russian]{babel}

%==== пакеты для оформления ======
\RequirePackage[top=0cm, bottom=2cm, outer=0cm, inner=0cm]{geometry}
\RequirePackage[pages=some]{background}
\RequirePackage{xcolor}
\RequirePackage{multicol}

%Color definition based on Material Design
%===== задания цветов ========
\definecolor{materialGreen} 	{RGB}{068,225,130}
\definecolor{materialGreenDark} {RGB}{029,184,090}
\definecolor{materialRed}   	{RGB}{218,068,049}
\definecolor{materialRedDark}   {RGB}{173,045,031}
\definecolor{materialPurple}   	{RGB}{153,039,176}
\definecolor{materialPurpleDark}{RGB}{088,022,099}
\definecolor{materialBlue}  	{RGB}{044,116,246}
\definecolor{materialBlueDark}  {RGB}{010,082,216}
\definecolor{materialYellow}	{RGB}{254,193,005}
\definecolor{materialYellowDark}{RGB}{194,147,001}
\definecolor{textGray}			{RGB}{070,070,070}
\definecolor{textLightGray}		{RGB}{140,140,140}

\newif\ifmaterialCV@russian
% == DON'T WORK
%\DeclareOption{russian}{\materialCV@russiantrue} 

% == выбор языка
\materialCV@russiantrue
% \materialCV@russianfalse

% == для головного файла
\setmainfont{Roboto}

\backgroundsetup{
scale=1,
color=black,
opacity=1,
placement=top,
angle=0,
contents={%
  \includegraphics[width=\paperwidth,height=200pt]{images/pic}
  }%
}

% === вставка фамилии и имени ====
\newcommand{\FI }[2]{
    \color{textGray}
    \pagenumbering{gobble}
	\vspace*{105pt} %spacing used to move the first and last name down
	\Huge
    \BgThispage
    \textcolor{white}{#1}
	\textcolor{white}{#2}
    \BgThispage
	\vspace*{20pt}
}
% === вспомогательная команда для изменения языка
\newcommand{\ruEng}[2]{\ifmaterialCV@russian #1 \else #2\fi}

% ==== создание нового раздела ====
%\makeParagraph{русский вариант}{английский вариант}{фоновый цвет}
\newcommand{\makeParagraph}[3] {
\LARGE
\noindent\colorbox{#3}
{\parbox[c][25pt][c]{\textwidth}{\hspace{15pt}\textcolor{white}{\ruEng{#1}{#2}}}} %%Contacts separator
}

% ==== общая команда для оформления мероприятия с датами ====
% ==== \BaseEntry{Год начала}{Год окончания}{название}{описание названия}{Место}
\newcommand{\BaseEntry}[7]{
\begin{tabular}{  p{\dimexpr 0.15\linewidth-2\tabcolsep} 
                   p{\dimexpr 0.70\linewidth-2\tabcolsep}}
  \textbf{\textcolor{#6}{#1-}}\textbf{\textcolor{#7}{#2}}\hspace{20pt} & \textbf{#3}\\
  	& \normalsize #4\\
  	&{\small \textcolor{textLightGray}{#5}}
\end{tabular}
\vspace*{10pt}
}

% ==== для контактов ====
% ==== раздел "контакты" ====
\newcommand{\contact}{
    \makeParagraph{Контакты}{Contacts}{materialGreen}
}

% ==== отдельный контакт ====
% === \ContactEntry{текст}{иконка} ===
\newcommand{\ContactEntry}[2]{
	$\begin{array}{l}
	{\includegraphics[height=15pt]{#1}}
	\end{array}
	$ #2
}



% === опыт работы ====
% ==== раздел "опыт работы" ====
\newcommand{\experience}{
    \makeParagraph{Опыт работы}{Experience}{materialRed}
}

% ==== для пункта работы ====
%\ExperienceEntry{starting year}{final year}{Position}{position description if applicable}{Place}
%\ExperienceEntry{год начала}{год окончания}{Позиция}{описание позиции}{место}
\newcommand{\ExperienceEntry}[5]{

    \BaseEntry{#1}{#2}{#3}{#4}{#5}{materialRedDark}{materialRed}
}


% ==== образование ====
% ==== раздел "образование" ====
\newcommand{\education}{
    \makeParagraph{Образование}{Education}{materialBlue}
}


% ==== для пункта образования ====
\newcommand{\EducationEntry}[5]{

    \BaseEntry{#1}{#2}{#3}{#4}{#5}{materialBlueDark}{materialBlue}
}


% ==== интересы ====
% ==== раздел "интересы" ====
\newcommand{\interests}{
    \makeParagraph{Интересы}{Interests}{materialYellow}
}

% ==== блок текста ====
\newcommand{\textBox}[1]{
\hspace*{4pt}
\begin{tabular}{  p{\dimexpr 0.97\linewidth-2\tabcolsep} }
  	{\normalsize #1}
\end{tabular}
\vspace*{4pt}
}

\newcommand{\personalInterests}[1]{
\textcolor{materialYellow}{\textbf{\ruEng{Лич}{Pers}}}\textcolor{textGray}{\textbf{\ruEng{ные}{onal}:}}\\
\textBox{
#1
}\\
}
\newcommand{\professionalInterests}[1]{
\textcolor{materialYellow}{\textbf{\ruEng{Проф}{Prof}}}\textcolor{textGray}{\textbf{\ruEng{ессиональные}{essional}:}}\\
\textBox{
#1
}\\
}

% ==== награды ====
% ==== раздел "награды" ====
\newcommand{\awards}{
    \makeParagraph{Достижения}{Awards}{materialPurple}
}

% пункт награды
\newcommand{\AwardEntry}[4]{
\begin{tabular}{ l l r }
  \textbf{\textcolor{materialPurple}{#1}}\hspace{20pt} & \textbf{#2} & {\small \textcolor{textLightGray}{#4}}\\
  	& \normalsize #3\\
\end{tabular}
\vspace*{10pt}
}
