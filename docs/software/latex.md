---
title: LaTeX
date: 2023-09-10
tags:
  - LaTeX
---

# PDF Metadata

## PDF/A-1b compliance

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
