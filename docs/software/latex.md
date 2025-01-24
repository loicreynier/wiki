---
title: LaTeX
tags:
  - LaTeX
  - PDF
icon: material/file-document-outline
---

# LaTeX

## PDF Metadata

### PDF/A-1b compliance

> PDF/A is an ISO-standardized version of the Portable Document Format (PDF)
> specialized for use in the archiving.
> PDF/A differs from PDF by prohibiting features
> unsuitable for long-term archiving,
> such as font linking (as opposed to font embedding) and encryption.
> The level B "basic" conformance requires only that standards necessary
> for the reliable reproduction of a document's visual appearance
> be followed.[^1]

PDF/A compliance can be checked with Acrobat Reader or veraPDF.

According to this
[answer on Stack Overflow](https://tex.stackexchange.com/questions/498987),
a PDF/A-compliant PDF could be generated using LuaLaTeX using
the following code:

```latex
\usepackage[pdfa]{hyperref}
\usepackage{hyperxmp}

\hypersetup{pdfapart=1, pdfaconformance=B} % PDF/A-1b

% Add an `OutputIntent` to PDF metadata to correctly specify colours
\immediate\pdfobj stream attr{/N 3} file{sRGB.icc}
\pdfcatalog{%
  /OutputIntents [
    <<
      /Type /OutputIntent
      /S /GTS_PDFA1
      /DestOutputProfile \the\pdflastobj\space 0 R
      /OutputConditionIdentifier (sRGB)
      /Info (sRGB)
    >>
  ]
}
```

However,
adding this code snippet to my PhD manuscript
did not enable it to pass the validation test with veraPDF.
On the other hand, the
[University Lyon1 archive service](https://scd-depot-theses.univ-lyon1.fr),
only accepts PDF/A-1b documents
and accepted the version generated with Firefox's "Print as PDF",
even though it also failed the test.

[^1]:
    Wikipedia contributors,"PDF/A," Wikipedia, The Free Encyclopedia,
    <https://en.wikipedia.org/w/index.php?title=PDF/A&oldid=1172480804>
    (accessed October 9, 2023).

## Graphics

### Include PDF

PDFs can be included in a LaTeX documents
using the `\includepdf` command from the `pdfpages` packages:

```latex
\usepackage{pdfpages}
\includepdf[pages={1,3-5,7},scale=0.8]{path/to/doc.pdf}
```

To include a PDF in a document page that has a section title
such as `\section`or `\chapter`,
one should utilize the `pagecommand` option.
This option declares a LaTeX command
that is executed on each page of the included PDF:

```latex
\ìncludepdf[scale=0.8,pagecommand={\section{Example}\hfill}]{path/to/doc.pdf}
```

Given that the command is executed on each page,
if one wishes to include a multipage PDF,
two imports are necessary:
one with the section including only the first page of the PDF,
and a second one without the option to include the rest of the PDF:

```latex
\includepdf
  [pages=1,scale=0.8,pagecommand={\section{Example}\hfill}]
  {path/to/doc.pdf}
\includepdf
  [pages=2-,scale=0.8,pagecommand={}]{path/to/doc.pdf}
```

The empty `pagecommand={}` is employed here
to ensure that the LaTeX header and footer (such as the page number),
are present on the pages where the PDF is included.

## Code highlighting with Minted

The [`minted`](https://github.com/gpoore/minted) package provides syntax highlighting
for code listing (and inline code) using the Pygments library.
It requires running system command, i.e. shell escape, which can be enabled in `.latexmkrc`

```perl
$pdf_mode = 4; # LuaLaTeX
$pdflatex = "pdflatex -shell-escape %O %S";
$lualatex = "lualatex --shell-escape %O %S";
$out_dir = "build";
$quiet = 1;
```

or directly from the command line as in `lualatex --shell-escape main.tex`.
Also, if using an alternative path for the build files (as in the above Latexmk configuration),
Minted caching should be disabled and the path must be specified:

```latex
\usepackage[cache=false,outputdir=./build]{minted}
```

### Minted in Beamer

<!-- markdownlint-disable MD046 -->

!!! Warning "`minted` listings and Beamer overlays may not interact well"

    Verbatim-like content conflicts with how processes overlays.
    Consider alternatives such as using multiples frames or uncovering entier code blocks.

In Beamer,
frames containing `minted` environments must be marked as `fragile` due to verbatim-like content:

```latex
\documentclass{beamer}
\usepackage{minted}
\begin{document}
  \begin{frame}[fragile]{Minted example}
    \begin{minted}[fontsize=\scriptsize, linenos]{cuda}
    __global__ void cudaHello(){
      printf("Hello World from GPU!\n");
    }

    int main() {
      cudaHello<<<1,1>>>();
      return 0;
    }
    \end{minted}
  \end{frame}
\end{document}
```
