%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following comments were written in Portuguese, because this 
% template applies only for School of Technology at University 
% of Campinas, Brazil.
%
% Este é um modelo LaTeX para monografias de Trabalhos de Conclusão 
% de Curso (TCC) na graduação da Faculdade de Engenharia Química (FEQ)
% da Universidade Estadual de Campinas (Unicamp) 
%
% Esse modelo e seu respectivo arquivo de classe de documento 
% foram adaptados do modelo de teses e dissertações do 
% Instituto de Computação e da Faculdade de Tecnologia da Unicamp, modificados incialmente por André Gradvohl. Segue o link do template original: <https://www.overleaf.com/latex/templates/template-for-graduation-work-masters-dissertation-or-doctoral-thesis-for-school-of-technology-unicamp/rhznqbkjvpcr>.
%
% Para dúvidas e sugestões, entre em contato comigo através do e-mail abaixo:
%
% Autor: Nathan Barros de Souza
% E-mail: n264179@dac.unicamp.br
% Data: 12/08/2022
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{TCC-FEQ}[]
\typeout{TCC-FEQ}

\newif\ifnofig
\newif\iffolhadeconcordancia
\newif\iffinalversion

\folhadeconcordanciafalse
\finalversionfalse
\nofigfalse

\def\thesislanguage#1{\gdef\@thesislanguage{#1}}
\DeclareOption{Ingles}{
  \thesislanguage{0}
  \typeout{TCC-FEQ: ingles.}
}
\DeclareOption{Espanhol}{
  \thesislanguage{1}
  \typeout{TCC-FEQ: espanhol.}
}
\DeclareOption{Portugues}{
  \thesislanguage{2}
  \typeout{TCC-FEQ: portugues.}
}
\DeclareOption{Draft}{
  \finalversionfalse
  \typeout{TCC-FEQ: Draft.}
}
\DeclareOption{Final}{
  \finalversiontrue
  \typeout{TCC-FEQ: versao final.}
}
\DeclareOption{noFig}{
  \nofigtrue
  \typeout{TCC-FEQ: Draft without figures.}
}
\DeclareOption{ComConcordancia}{
  \folhadeconcordanciatrue
  \typeout{TCC-FEQ: com folha de concordância.}
}
\DeclareOption{SemConcordancia}{
  \folhadeconcordanciafalse
  \typeout{TCC-FEQ: sem folha de concordância.}
}

\ProcessOptions\relax

% Classe base: Relatório
% Se for a versão final, inclui as figuras
\iffinalversion
  \LoadClass[12pt,a4paper,twoside]{report}
  % Pacote Silence para ocultar a advertência para o brazilian-abnt.
  % Use a opção "[debrief]" para inspecionar melhor o documento.
  \RequirePackage{silence}
  \WarningsOff[biblatex]
\else %Caso contrário, segue no formato Draft.
  \LoadClass[12pt,a4paper,draft,twoside]{report}
  \ifnofig %Se nofig estiver ativado, não inclua as figuras.
  \usepackage[allfiguresdraft]{draftfigure}
  \fi
\fi
%
%Pacotes padrão para as línguas usadas no texto.
\RequirePackage[english,spanish,portuguese,brazil]{babel}
\RequirePackage{fancyhdr}
%Pacotes para determinar o tipo de fonte usada para imprimir o texto
\RequirePackage[ttscale=.875]{libertine}
\RequirePackage{libertinust1math}
\RequirePackage[T1]{fontenc}
%Pacotes para determinar o tipo de fonte usada para escrever o texto
\RequirePackage[utf8]{inputenc}
%Pacotes para facilitar a inclusão das figuras
\RequirePackage{graphicx}
\graphicspath{{./logotipos/}{./figuras/}}
\PassOptionsToPackage{table}{xcolor}
%Pacotes para incluir os hiperlinks no texto
\RequirePackage{hyperref}
%Mantenha o pacote a seguir para incluir a lista de abreviaturas.
\RequirePackage{nomencl} \makenomenclature
%Outros pacotes
\RequirePackage{subfig}
\RequirePackage{pdfpages}
\RequirePackage{xspace}
\RequirePackage{setspace}
\RequirePackage{indentfirst}
\RequirePackage{geometry}
\geometry{a4paper,top=30mm,bottom=20mm,inner=30mm,outer=20mm}
\RequirePackage{csquotes}
%Pacotes para adicionar a bibliografia
% Coloque a opção uniquename=false, se não quiser que o Biblatex faça a desambiguação de nomes.
\RequirePackage[style=abnt,uniquename=init,giveninits,uniquelist=true,maxbibnames=4,repeatfields=true,justify]{biblatex}
%Pacote para tabelas mais interessantes
\RequirePackage{booktabs}
\renewcommand{\arraystretch}{1.2}
%Teste com pacote listofitems
\RequirePackage{listofitems}
\RequirePackage{ifthen}
%
% Definição de novos comandos
\newcommand{\@FEQ}{Faculdade de Engenharia Química}
\newcommand{\@FEQen}{School of Chemical Engineering}
\newcommand{\@FEQes}{Faculdad de Ingeniería Química}
\newcommand{\@FEQsigla}{FEQ}
\newcommand{\@UNICAMP}{Universidade Estadual de Campinas}
\newcommand{\@UNICAMPen}{State University of Campinas}
\newcommand{\@UNICAMPes}{Universidad Estatal de Campinas}
%
% Contadores
\newcounter{countermale}
\newcounter{counterfemale}
\newcounter{counterauthors}
\setcounter{countermale}{0}
\setcounter{counterfemale}{0}
\setcounter{counterauthors}{0}
%
% Criação de variáveis para o texto.
\let\@primeiroautor\relax
\def\primeiroautor#1{\gdef\@primeiroautor{#1}}
\author{\@primeiroautor}
%
\let\@primeiraautora\relax
\def\primeiraautora#1{\gdef\@primeiraautora{#1}}
%
\let\@segundoautor\relax
\def\segundoautor#1{\gdef\@segundoautor{#1}}
%
\let\@segundaautora\relax
\def\segundaautora#1{\gdef\@segundaautora{#1}}
%
\let\@titulo\relax
\def\titulo#1{\gdef\@titulo{#1}}
\title{\@titulo}
%
\def\grau#1{\gdef\@grau{#1}}
%
\def\cidade#1{\gdef\@cidade{#1}}
\def\estadosigla#1{\gdef\@estadosigla{#1}}
%
\def\agencia#1{\gdef\@agencia{#1}}
\def\agenciasigla#1{\gdef\@agenciasigla{#1}}
\def\noprocesso#1{\gdef\@noprocesso{#1}}
%
\newif\ifmaster
%
%%%%
\gdef\bsi{
%added
  \gdef\@textoaviso{\relax}
  \gdef\@artigofinal{o}
  \if\@primeiraautora\relax
    \ifnum\value{counterauthors}>1
      \if\@segundaautora\relax
        \gdef\@degnamept{Bacharel em Engenharia Química}
        \gdef\@degnamees{Licenciatura en Ingeniería Química}
        \gdef\@artigo{o}
      \else
        \gdef\@degnamept{Bacharel em Engenharia Química}
        \gdef\@degnamees{Licenciatura en Ingeniería Química}
        \gdef\@artigo{o}
      \fi
    \else
      \gdef\@degnamept{Bacharel em Engenharia Química}
      \gdef\@degnamees{Licenciatura en Ingeniería Química}
      \gdef\@artigo{o}
    \fi
  \else
    \ifnum\value{counterauthors}>1
      \if\@segundaautora\relax
        \gdef\@degnamept{Bacharel em Engenharia Química}
        \gdef\@degnamees{Licenciatura en Ingeniería Química}
        \gdef\@artigo{o}
      \else
        \gdef\@degnamept{Bacharela em Engenharia Química}
        \gdef\@degnamees{Bacharela}
        \gdef\@artigo{a}
      \fi
    \else
      \gdef\@degnamept{Bacharela em Engenharia Química}
      \gdef\@degnamees{Bacharela}
      \gdef\@artigo{a}
    \fi
  \fi
  \gdef\@degnameen{Bachelor in Chemical Engineering}
  \gdef\@monopt{Trabalho de Conclusão de Curso}
  \gdef\@monoes{Trabajo de Fin de Curso}
  \gdef\@monoen{Graduation Final Paper}
}

\let\@supervisor\relax
\def\supervisor#1{\gdef\@supervisor{#1}}

\let\@supervisora\relax
\def\supervisora#1{\gdef\@supervisora{#1}}

\def\datadadefesa#1#2#3{
  \gdef\@dia{#1}
  \gdef\@mes{#2}
  \gdef\@ano{#3}
}

\let\@fichacatalografica\relax
\def\fichacatalografica#1{\gdef\@fichacatalografica{#1}}

\let\@avalA\relax
\let\@avalB\relax
\let\@avalC\relax
\let\@avalD\relax
\let\@avalE\relax
\let\@avalF\relax
\let\@avalG\relax
\let\@avalH\relax
\let\@instavalA\relax
\let\@instavalB\relax
\let\@instavalC\relax
\let\@instavalD\relax
\let\@instavalE\relax
\let\@instavalF\relax
\let\@instavalG\relax
\let\@instavalH\relax

\def\avaliadorA#1#2{\gdef\@avalA{#1}\gdef\@instavalA{#2}}
\def\avaliadorB#1#2{\gdef\@avalB{#1}\gdef\@instavalB{#2}}
\def\avaliadorC#1#2{\gdef\@avalC{#1}\gdef\@instavalC{#2}}
\def\avaliadorD#1#2{\gdef\@avalD{#1}\gdef\@instavalD{#2}}
\def\avaliadorE#1#2{\gdef\@avalE{#1}\gdef\@instavalE{#2}}
\def\avaliadorF#1#2{\gdef\@avalF{#1}\gdef\@instavalF{#2}}
\def\avaliadorG#1#2{\gdef\@avalG{#1}\gdef\@instavalG{#2}}
\def\avaliadorH#1#2{\gdef\@avalH{#1}\gdef\@instavalH{#2}}

\def\inicializacao{
%
  \if\@primeiraautora\relax
  %
    \gdef\@autores{1}
    \addtocounter{countermale}{1}
    %
    \ifnum\value{counterauthors}>1
      \if\@segundaautora\relax
        \gdef\@autores{2}
        \gdef\@artigoconjunto{os}
        \addtocounter{countermale}{1}
      \else
        \gdef\@autores{2}
        \gdef\@artigoconjunto{os}
        \addtocounter{counterfemale}{1}
      \fi
    \fi
  %
  \else
  %
    \gdef\@autoras{1}
    \addtocounter{counterfemale}{1}
    %
    \ifnum\value{counterauthors}>1
      \if\@segundaautora\relax
        \gdef\@autores{2}
        \gdef\@artigoconjunto{os}
        \addtocounter{countermale}{1}
      \else
        \gdef\@autoras{2}
        \gdef\@artigoconjunto{as}
        \addtocounter{counterfemale}{1}
      \fi
    \fi
    %
  \fi
}

\def\paginasiniciais{
  \newlength{\oldparindent}
  \setlength{\oldparindent}{\parindent}
  \setlength\parindent{0pt}
  \thispagestyle{empty}
  \pagestyle{empty}  
  \makeatletter
  \let\ps@mystyle\ps@plain
  \let\ps@plain\ps@empty
  \makeatother
  \openningpage
  \clearpage
  \titlepage

  \@textoaviso

  %Definição de títulos específicos, dependendo do idioma
  \ifcase\@thesislanguage\relax
  %English
  \renewcommand{\nomname}{List of Acronyms}
  \or%Español
  \renewcommand{\nomname}{Lista de abreviaturas y acrónimos}
  \or%Português 
  \renewcommand{\nomname}{Lista de Abreviaturas e Siglas}
  \fi
%}

  \clearpage
  \authorship
  \clearpage
  \iffolhadeconcordancia
  \concordancia
  \clearpage
  \fi
  \setlength{\parindent}{\oldparindent}
  \resetlang
}

\def\logos{
    {\parbox[c]{0cm}{\includegraphics[width=2.2cm]{logo-unicamp.pdf}}}
       {\parbox[c]{\textwidth}
       {
         \noindent
         \centering{
           \large \MakeUppercase{\@UNICAMP}\\
                   \@FEQ}
       }
           
       }
}

\def\openningpage{
  \logos
  \vskip 70mm%35mm
  \begin{center}
    \Large
    {\bf \if\@primeiraautora\relax\@primeiroautor\else\@primeiraautora\fi}
    \ifnum\value{counterauthors}>1
    \\
    \vskip 5mm
    \Large
    {\bf \if\@segundaautora\relax\@segundoautor\else\@segundaautora\fi}
    \fi
    \vskip 25mm
    \ifcase\@thesislanguage
      {\bf\@title}
      \vskip 25mm
    \or
      {\bf\@title}
      \vskip 25mm
    \fi
    {\bf \@titulo}
    \vfill
    \large
    \@cidade\\\@ano
  \end{center}
}

\def\titlepage{
  \large\bf
  \vfill
  \begin{center}
    \if\@primeiraautora\relax\@primeiroautor\else\@primeiraautora\fi
    \ifnum\value{counterauthors}>1
    \\
    \vskip 2mm
    \if\@segundaautora\relax\@segundoautor\else\@segundaautora\fi
    \fi
    \vfill
    \ifcase\@thesislanguage
      \@title
      \vskip 8mm
    \or
      \@title
      \vskip 8mm
    \fi
    \@titulo
  \end{center}
  \vfill
  \normalfont
  \normalsize
  \hfill\begin{minipage}[t]{0.54\textwidth}
    \supresshyphen
    \@monopt\xspace apresentad\@artigofinal\xspace à \@FEQ\xspace da \@UNICAMP\xspace como parte dos requisitos para a obtenção do título de \@degnamept\xspace .
  \end{minipage}
  \ifcase\@thesislanguage
    \vskip 8mm
    \hfill\begin{minipage}[t]{0.54\textwidth}
      \supresshyphen
      \@monoen\xspace presented to the \@FEQen\xspace of the
      \@UNICAMPen\xspace in partial fulfillment of the requirements for
      the degree of \@degnameen\xspace .
    \end{minipage}
  \or
    \vskip 8mm
    \hfill\begin{minipage}[t]{0.54\textwidth}
      \supresshyphen
      \@monoes\xspace presentad\@artigofinal\xspace a \@FEQes\xspace de la \@UNICAMPes\xspace para obtener el título de
      \@degnamees\xspace .
    \end{minipage}
  \fi
  \vfill
  \ifcase\@thesislanguage
    {\bf Supervisor/}\hspace{-0.9ex}
  \fi
  \if\@supervisora\relax {\bf Supervisor: \@supervisor}
  \else {\bf Supervisora: \@supervisora}
  \fi
  \vfill
  \iffinalversion
    \begin{minipage}[t]{0.5\textwidth}
      \supresshyphen
      Este trabalho corresponde à versão final d\@artigofinal\xspace \@monopt\xspace defendid\@artigofinal\xspace por
      \if\@primeiraautora\relax\@primeiroautor\else\@primeiraautora\fi\xspace \ifnum\value{counterauthors}>1
      {\xspace e por }\if\@segundaautora\relax\@segundoautor\else\@segundaautora\fi\xspace\fi e supervisionad\@artigofinal\xspace
      \if\@supervisora\relax pelo \@supervisor\else pela \@supervisora\fi.
    \end{minipage}
  \else
    \begin{minipage}[t]{0.5\textwidth}
      \supresshyphen
      Este exemplar corresponde à versão d\@artigofinal\xspace \@monopt\xspace entregue
      à banca antes da defesa.
    \end{minipage}
  \fi
  \vfill
  \begin{center}
    \large
    \@cidade\\\@ano
  \end{center}
}

\def\authorship{
  \iffinalversion
    \noindent\centerline{\large\MakeUppercase{\textbf{Declaração de autoria}}}
%
    \vskip 20mm

      \begin{minipage}{1.0\textwidth}
      \supresshyphen
      \noindent
       \ifnum\value{counterauthors}>1 Nós\else Eu\fi , \if\@primeiraautora\relax\@primeiroautor\else\@primeiraautora\fi \ifnum\value{counterauthors}>1
      {\xspace e }\if\@segundaautora\relax\@segundoautor\else\@segundaautora\fi\fi , \ifnum\value{counterauthors}>1 declaramos\else declaro\fi\xspace que esse trabalho é de autoria própria e que as partes que não o são foram referenciadas ao longo de todo o trabalho.
      \end{minipage}\par\vskip 7.5mm
       \hfill \@cidade , \@dia\xspace de \ifcase \@mes \or janeiro\or fevereiro\or março\or abril\or maio\or junho\or julho\or agosto\or setembro\or outubro\or novembro\or dezembro\fi\xspace de \@ano .
       \vfill
  \else
    Na versão final, esta página será substituída por outra
    constando a declaração de autoria.
  \fi
}

\def\concordancia{
\iffolhadeconcordancia
\noindent\centerline{\large\MakeUppercase{\textbf{Folha de Concordância}}}
\vskip 20mm
\fi
}

\def\prefacesection#1{
  \chapter*{#1}
  %\addcontentsline{toc}{chapter}{#1}
  \pagestyle{empty}
  \thispagestyle{empty}
}

\gdef\resetlang{
  \ifcase\@thesislanguage\relax
  \selectlanguage{english}
  \or\selectlanguage{spanish}
  \or\selectlanguage{brazil}
  \fi
}

\gdef\supresshyphen{
  \tolerance=1
  \emergencystretch=\maxdimen
  \hyphenpenalty=10000
  \hbadness=10000
}

% Definição dos Elementos Pré-textuais
\newenvironment{resumo}{\prefacesection{Resumo}\selectlanguage{brazil}}{\resetlang \newpage}
\renewenvironment{abstract}{\prefacesection{Abstract}\selectlanguage{english}}{\resetlang \newpage}
\newenvironment{resumen}{\prefacesection{Resumen}\selectlanguage{spanish}}{\resetlang \newpage}

\newenvironment{epigrafe}{\newpage\mbox{}\vfill\hfill\begin{minipage}[t]{0.5\textwidth}}
{\end{minipage}\newpage}

\newcommand{\fimdaspaginasiniciais}{
\newpage
\makeatletter
\let\ps@plain\ps@mystyle
\makeatother

%Definição das primeiras páginas dos capítulos
\fancypagestyle{plain}{
  \fancyhf{}% Limpa todos os campos
  \fancyhead[R]{\thepage}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\headheight}{14.49999pt}%
}

%Definição das demais páginas do texto
\fancypagestyle{headings}{%
  \fancyhf{}% Limpa todos os campos
  \fancyhead[L]{\textsc{\nouppercase{\leftmark}}}
  \fancyhead[R]{\thepage}% Numero da página à direita
  \renewcommand{\headrulewidth}{1pt}%
  \renewcommand{\headheight}{14.49999pt}%
}

\pagestyle{headings}

\setstretch{1.5} %Definido espaçamento entre linhas de 1,5
}

%controle de linhas órfãs e viúvas.
\widowpenalty10000
\clubpenalty10000

%Filtragem dos parâmetros para múltiplas referências.
\newcounter{cnt}
\newcommand{\procitems}[1] {%
  \setcounter{cnt}{1}%
  \setsepchar{,}%
  \readlist*\argumentos{#1}%
  \ifthenelse{\argumentoslen>1}{%
      \whiledo{\argumentoslen>\the\numexpr\value{cnt}+1\relax}{%
         \ref{\argumentos[\value{cnt}]},\xspace
         \stepcounter{cnt}%
     }%
     \ref{\argumentos[-2]} e \ref{\argumentos[-1]}%
    }{% else
       \ref{\argumentos[1]}%
    }%
}%
%
%comandos específicos para referenciar Figuras, Tabelas, Seções etc.
\newcommand{\Capitulo}[1] {Capítulo~\ref{#1}}
\newcommand{\capitulos}[1]{capítulos \procitems{#1}}
\newcommand{\Secao}[1] {Seção~\ref{#1}}
\newcommand{\secoes}[1]{seções \procitems{#1}}
\newcommand{\Figura}[1]{Figura~\ref{#1}}
\newcommand{\figuras}[1]{figuras \procitems{#1}}
\newcommand{\Tabela}[1] {Tabela~\ref{#1}}
\newcommand{\tabelas}[1]{tabelas \procitems{#1}}
\newcommand{\Equacao}[1] {Equação~\ref{#1}}
\newcommand{\equacoes}[1]{equações \procitems{#1}}
\newcommand{\Subfigura}[1]{\protect\subref{#1}}
\newcommand{\Subfigurasp}[1]{\ref{#1}}

%Comandos para abreviações especiais
\newcommand{\ie}{i.\,e.\xspace}
\newcommand{\eg}{e.\,g.\xspace}
\newcommand{\pex}{p.\,ex.\xspace}

%Comandos para adição de siglas 
\newcommand{\Sigla}[2]{#1 (#2)\nomenclature{#2}{#1}}
\newcommand{\SiglaHifen}[2]{#1 -- #2\nomenclature{#2}{#1}}