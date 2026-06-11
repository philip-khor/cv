#import "@preview/modern-cv:0.10.0": *
#import "@preview/fontawesome:0.6.0": fa-version

#fa-version("6")

#let accent-clr = rgb("555555")

#show: resume.with(
  author: (
    firstname: "Philip",
    lastname: "Khor",
    email: "pk.qa@outlook.com",
    phone: "+60 16 720 2723",
    homepage: "philipscurve.com",
    github: "philip-khor",
    linkedin: "philip-khor",
    address: "Penang, Malaysia",
    positions: ("Data Scientist",),
  ),
  profile-picture: none,
  accent-color: accent-clr,
  colored-headers: true,
  font: ("Roboto",),
  header-font: "Roboto",
)

#show heading.where(level: 1): it => {
  block[
    #set text(size: 12pt)
    #text(accent-clr, weight: "bold")[#it.body]
    #box(width: 1fr, stroke: (bottom: 1pt + accent-clr))
  ]
}

#let resume-entry(
  title: none,
  location: "",
  date: "",
  description: "",
  title-link: none,
) = {
  let title-content
  if type(title-link) == str {
    title-content = link(title-link)[#title]
  } else {
    title-content = title
  }
  block(above: 1em, below: 0.65em)[
    #pad[
      justified-header(title-content, location)
      if description != "" or date != "" [
        secondary-justified-header(description, date)
      ]
    ]
  ]
}

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
  resume-entry(
    title: str(e.company),
    location: str(e.location),
    date: str(e.year),
    description: str(e.position),
  )
  resume-item(
    e.details.map(d => [- #d]).join([])
  )
}

= Publications

#bibliography("src/cvlib.bib", title: none, full: true)

= Projects

#for p in proj {
  resume-entry(
    title: str(p.project_title),
    location: str(p.location),
    date: str(p.year),
    description: if p.project_type == "" { none } else { str(p.project_type) },
  )
  resume-item(
    p.details.map(d => [- #d]).join([])
  )
}

= Education

#for e in edu {
  resume-entry(
    title: str(e.degree),
    location: str(e.where),
    date: str(e.year),
    description: str(e.institution),
  )
  resume-item(
    e.details.map(d => [- #d]).join([])
  )
}

= Qualifications

#for q in qual {
  resume-entry(
    title: str(q.qualification),
    location: str(q.where),
    date: str(q.year),
    description: str(q.institution),
  )
  resume-item(
    q.details.map(d => [- #d]).join([])
  )
}
