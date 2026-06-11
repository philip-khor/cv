#import "@preview/fontawesome:0.6.0": fa-version, fa-icon

#fa-version("6")

#let accent = rgb("555555")

#set page(paper: "a4", margin: (left: 15mm, right: 15mm, top: 10mm, bottom: 20mm))
#set text(font: ("Roboto",), size: 10pt, fill: rgb("#333333"))
#set heading(numbering: none, outlined: false)
#set par(justify: true, leading: 0.5em)

#show heading.where(level: 1): it => {
  block(above: 0.3em, below: 0.1em)[
    #set text(size: 14pt, weight: "bold", fill: accent)
    #it.body
    #box(width: 1fr, stroke: (bottom: 0.5pt + accent))
  ]
}

#let entry(title, location: "", date: "", description: "") = {
  block(above: 0.7em, below: 0.1em)[
    #grid(columns: (1fr, auto))[
      #text(weight: "bold", size: 10pt)[#title]
    ][
      #align(right, text(size: 9pt, fill: gray)[#location])
    ]
    #if (type(description) == str and description != "") or date != "" [
      #grid(columns: (1fr, auto))[
        #if type(description) == str and description != "" [
          #text(size: 9pt, style: "italic", fill: rgb("#555555"))[#description]
        ] else [
          #text(size: 9pt)[]
        ]
      ][
        #if date != "" [
          #align(right, text(size: 9pt, fill: gray)[#date])
        ]
      ]
    ]
  ]
}

#let item(body) = {
  block(above: 0.15em, below: 0.5em)[
    #set text(size: 9pt, weight: "light")
    #set par(leading: 0.5em)
    #body
  ]
}

#align(center, text(size: 30pt, weight: "thin", fill: accent)["Philip"] + text(size: 30pt, weight: "bold", fill: accent)[" Khor"])

#align(center, text(size: 9pt, fill: accent, weight: "regular", style: "normal")[Data Scientist])

#align(center, text(size: 8pt)[#fa-icon("location-dot") Penang, Malaysia  \  #fa-icon("envelope") pk.qa\@outlook.com  \  #fa-icon("globe") philipscurve.com  \  #fa-icon("github") github.com/philip-khor  \  #fa-icon("linkedin") linkedin.com/in/philip-khor])

#block(above: 0.5em)

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
