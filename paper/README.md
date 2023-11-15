# Paper

How to run Markdown file in this directory if you do not want to use Make.

To PDF: 
`pandoc default.yaml uganda_covid_wber_revisions.md -o uganda_covid_wber_revisions.pdf --pdf-engine=xelatex -N -s --filter pandoc-crossref --citeproc`

To Word:
`pandoc default.yaml uganda_covid_wber_revisions.md -o uganda_covid_wber_revisions.docx -N -s --filter pandoc-crossref --citeproc`
