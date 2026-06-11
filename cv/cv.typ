#let accent = rgb("555555")

#set page(paper: "a4", margin: (left: 15mm, right: 15mm, top: 10mm, bottom: 15mm))
#set text(font: ("Roboto",), size: 10pt, fill: rgb("#333333"))
#set heading(numbering: none, outlined: false)
#set par(justify: true)

#show heading.where(level: 1): it => {
  block[
    #set text(size: 12pt, weight: "bold", fill: accent)
    #it.body
    #box(width: 1fr, stroke: (bottom: 1pt + accent))
  ]
}

#let sec-heading(body) = {
  heading(level: 1)[#body]
}

#let entry(title, location: "", date: "", description: "") = {
  block(above: 6pt, below: 2pt)[
    #grid(columns: (1fr, auto))[
      #text(weight: "bold", size: 10pt)[#title]
    ][
      #text(size: 9pt, fill: gray)[#location]
    ]
    #if description != "" [
      #text(size: 9pt, style: "italic", fill: rgb("#555555"))[#description]
    ]
    #if date != "" [
      #text(size: 9pt, fill: gray)[#date]
    ]
  ]
}

#let item(body) = {
  block(above: 4pt, below: 6pt)[
    #text(size: 9.5pt, weight: "light")[#body]
  ]
}

#align(center, text(size: 24pt, weight: "thin", fill: accent)["Philip"] + text(size: 24pt, weight: "bold", fill: accent)[" Khor"])

#align(center, text(size: 9pt, fill: accent, weight: "regular")[Data Scientist])

#align(center, text(size: 9pt)[Penang, Malaysia  ·  pk.qa\@outlook.com  ·  philipscurve.com  ·  github.com/philip-khor  ·  linkedin.com/in/philip-khor])

#block(above: 8pt)

#let exp = yaml("src/experience.yaml")
#let proj = yaml("src/projects.yaml")
#let edu = yaml("src/education.yaml")
#let qual = yaml("src/qualifications.yaml")

= Summary

Economist by training, data scientist by practice. Experience spans ESG ratings
methodology, sustainability disclosure standards, LLM systems, policy analysis,
credit risk modelling, fair ML, and applied microeconometrics.

= Work Experience

#for e in exp {
  entry(str(e.company), location: str(e.location), date: str(e.year), description: str(e.position))
  item(e.details.map(d => [- #d]).join([]))
}

= Publications

#bibliography("src/cvlib.bib", title: none, full: true)

= Projects

#for p in proj {
  entry(str(p.project_title), location: str(p.location), date: str(p.year), description: if p.project_type == "" { none } else { str(p.project_type) })
  item(p.details.map(d => [- #d]).join([]))
}

= Education

#for e in edu {
  entry(str(e.degree), location: str(e.where), date: str(e.year), description: str(e.institution))
  item(e.details.map(d => [- #d]).join([]))
}

= Qualifications

#for q in qual {
  entry(str(q.qualification), location: str(q.where), date: str(q.year), description: str(q.institution))
  item(q.details.map(d => [- #d]).join([]))
}
