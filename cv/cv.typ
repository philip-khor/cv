#import "@local/modern-cv:0.11.0": *
#fa-version("7")

#show: resume.with(
  author: (
    firstname: "Philip",
    lastname: "Khor",
    email: "pk.qa@outlook.com",
    homepage: "philipscurve.com",
    github: "philip-khor",
    linkedin: "philip-khor",
    address: "Penang, Malaysia",
    positions: ("Data Scientist",),
  ),
  profile-picture: none,
  language: "en",
  colored-headers: false,
  accent-color: rgb("#555555"),
  show-footer: false,
  paper-size: "a4",
  date: none,
  font: ("Roboto",),
  header-font: "Roboto",
)

#let exp = yaml("src/experience.yaml")
#let proj = yaml("src/projects.yaml")
#let edu = yaml("src/education.yaml")
#let qual = yaml("src/qualifications.yaml")
#let pubs = yaml("src/publications.yaml")

= Summary

Economist by training, data scientist by practice. Python and R across ML modelling, LLM pipelines, and applied econometrics — ESG/sustainability, regulatory machine learning, and economic policy. Technical educator across industries — banking, think-tanks, and corporate training.

*Skills*: Python, R, SQL • XGBoost (monotonic constraints), scikit-learn • LLM/agent systems: prompt architecture, RAG, Flowise • Agentic coding: Claude Code, OpenCode • MongoDB, DuckDB, AWS • Tableau • Credit risk: Basel, IFRS 9 • ESG/ISSB: FTSE Russell methodology, IFRS S1/S2

= Work Experience

#for e in exp {
  resume-entry(
    title: str(e.position),
    location: str(e.location),
    date: str(e.year),
    description: str(e.company),
  )
  resume-item[
    #for d in e.details [- #d]
  ]
}

= Research & Projects

#for p in proj {
  resume-entry(
    title: str(p.project_title),
    location: str(p.location),
    date: str(p.year),
    description: if p.project_type == "" { "" } else { str(p.project_type) },
  )
  resume-item[
    #for d in p.details [- #d]
    #if "url" in p [- #link(p.url)[#p.url]]
  ]
}

#resume-item[
  *Selected articles and reports:*
  #for p in pubs [
    - #text(style: "italic")[#p.title]#if "coauthors" in p [ (with #p.coauthors)]. #p.venue, #p.date#if "note" in p [ \[#p.note\]].
  ]
]

= Education

#for e in edu {
  resume-entry(
    title: str(e.degree),
    location: str(e.where),
    date: str(e.year),
    description: str(e.institution),
  )
  resume-item[
    #for d in e.details [- #d]
  ]
}

= Qualifications

#for q in qual {
  resume-entry(
    title: str(q.qualification),
    location: str(q.where),
    date: str(q.year),
    description: str(q.institution),
  )
  resume-item[
    #for d in q.details [- #d]
  ]
}
