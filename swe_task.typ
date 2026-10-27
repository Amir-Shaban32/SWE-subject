#let muted = luma(90)

#set document(
  title: "Software Engineering Task",
  author: ("Amir Shaaban", "Ahmed Sharabi", "Hazem Mahmoud", "Hazem Abubakr"),
)

#set page(
  paper: "a4",
  margin: (x: 3.2cm, y: 3cm),

  header: context {
    let pg = here().page()
    let chapters = query(heading.where(level: 1))
    if chapters.any(h => h.location().page() == pg) { return }
    let before = chapters.filter(h => h.location().page() < pg)
    if before.len() > 0 {
      align(center, text(size: 9.5pt, style: "italic", fill: muted, before.last().body))
    }
  },
  footer: context {
    if page.numbering != none {
      align(center, text(size: 10pt, counter(page).display(page.numbering)))
    }
  },
)

#set text(lang: "en", size: 11.5pt)
#set par(justify: true, leading: 0.72em, spacing: 1.15em)

#set enum(indent: 4.6pt, body-indent: 9.2pt, spacing: 0.9em)
#set list(indent: 4.4pt, body-indent: 6pt, spacing: 0.9em)

#set heading(numbering: (..n) => if n.pos().len() <= 2 { numbering("1.1", ..n) })

#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  v(2.5cm)
  block(width: 100%, below: 47.3pt, {
    set par(spacing: 0pt, leading: 0pt)
    text(size: 11.5pt, style: "italic", weight: "bold", fill: muted)[
      Chapter #numbering(it.numbering, ..counter(heading).at(it.location()))
    ]
    v(28.8pt)
    text(size: 27pt, weight: "regular", it.body)
    v(11.5pt)
    line(length: 2.2cm, stroke: 1pt)
  })
}

#show heading.where(level: 2): it => {
  // The first subsection of a chapter sits a bit lower than later ones
  let first = counter(heading).at(it.location()).at(1) == 1
  block(
    above: if first { 66.8pt } else { 27.4pt },
    below: 14pt,
    sticky: true,
    {
      text(size: 14pt, weight: "bold", {
        numbering(it.numbering, ..counter(heading).at(it.location()))
        h(12pt)
        it.body
      })
    },
  )
}

#show heading.where(level: 3): it => {
  block(above: 18pt, below: 1.15em, sticky: true, text(size: 12pt, weight: "regular", style: "italic", it.body))
}

#let item(label, body) = par[_#label._ #body]

#let note(body) = block(
  width: 100%,
  inset: (left: 11.5pt, y: 2pt),
  stroke: (left: 0.6pt + black),
  {
    set text(size: 11pt)
    set par(leading: 0.7em, spacing: 0.7em)
    set list(spacing: 0.7em)
    body
  },
)

#set table(
  stroke: none,
  inset: (x: 6pt, y: 8pt),
)
#show table: set block(above: 1.5em, below: 1.5em)
#show table: set text(hyphenate: false)

#set page(numbering: none)

#place(top + center, dy: 199.7pt, text(size: 34pt)[Software Engineering Task])
#place(top + center, dy: 255.4pt, text(
  size: 15pt,
  style: "italic",
  fill: muted,
)[Smart Exam Platform with AI Proctoring])
#place(top + center, dy: 294.7pt, line(length: 3cm, stroke: 1pt))
#place(top + center, dy: 493.9pt)[
  Amir Shaaban \
  Ahmed Sharabi \
  Hazem Mahmoud \
  Hazem Abubakr
]
#place(top + center, dy: 564.2pt, text(fill: muted)[Section 2])
#place(top + center, dy: 636.6pt, text(size: 10.5pt, style: "italic", fill: muted)[Development methodology: Agile])

#set page(numbering: "i")

#v(2.5cm)
#text(size: 27pt, weight: "regular")[Contents]
#v(1.5pt)
#line(length: 2.2cm, stroke: 1pt)
#v(39.1pt)

#show outline.entry.where(level: 1): it => {
  v(1.15em, weak: true)
  text(size: 12pt, it)
}
#show outline.entry.where(level: 2): it => text(size: 11pt, fill: muted, it)

#outline(title: none, depth: 2, indent: 16.5pt)


#set page(numbering: "1")
#counter(page).update(1)

= Problem and idea

== The problem

Online teachers, and teachers in general, lack an integrated platform that automates everything they need. Most existing platforms focus only on delivering content. Exams then bring organizational problems and heavy pressure, and teachers fall back on primitive or semi-manual tools such as Google Sheets, with a lot of manual data entry.

== The proposed solution

The solution is an integrated smart exam platform powered by artificial intelligence (AI). It has three main parts.

#item[Student tracking and monitoring][Accurate eye-movement tracking confirms that the student is paying attention to the exam screen.]

#item[Cheating detection and exam environment][The system verifies that no other people are in the room during the exam and automatically checks that the student's camera and microphone are on.]

#item[Results dashboard][Student grades are collected automatically and shown to the teacher in a live, comprehensive dashboard, which removes manual work.]

= System requirements

== General user requirements

+ _Learning platform._ A learning environment for managing lessons and content.
+ _Exam platform._ An integrated system for generating, scheduling, and conducting exams.
+ _AI proctoring._ An automated, intelligent monitoring system that tracks student behavior and eye movement and detects cheating attempts during the exam.
+ _Grades dashboard._ Collects and analyzes student grades and exam results and shows them directly to the teacher.
+ _Auto SMS._ Sends automatic SMS notifications and alerts to parents in case of absence or poor performance.
+ _Support chatbot._ An intelligent chatbot that answers student questions and resolves initial problems, and escalates to human technical support when a problem cannot be solved.
+ _Payment gateway._ Online payment gateways for paying monthly subscriptions and renewing teacher plans.

== Functional requirements by role

=== Student

#item[Course and teacher selection][Students log in, browse available subjects, choose a teacher, and join that teacher's group.]

#item[Lecture access][Students watch recorded lectures and attend live interactive sessions.]

#item[Academic dashboard][Students track exam grades, attendance rates, the academic calendar, and the schedule of upcoming classes and exams.]

=== Teacher

#item[Student management][Teachers view the list of registered students and track their data, grades, and activity.]

#item[Content management][Teachers upload recorded lectures and organize classes.]

#item[Question and exam bank][Teachers create custom exams and pull questions from their own question bank.]

#item[Exam settings][Teachers configure the start time, duration, passing grade, and anti-cheating measures of each exam.]

=== Parent

#item[Progress tracking][Parents receive automatic periodic SMS reports on the student's level, exam results, and absence and performance record.]

=== Exam platform security and AI engine

#item[Secure exam environment][The platform requires camera and microphone activation, verifies the student's identity, and locks the browser to prevent switching between windows.]

#item[AI proctoring engine][The engine monitors eye movement and alerts the student when their gaze wanders, they leave the camera frame, or unauthorized people enter.]

== Non-functional requirements

#note[
  _Draft._ Non-functional requirements still need to be added. Initial areas:
  - Security and privacy
  - Responsiveness under high load during exams (performance)
]

= Methodology: Agile versus Waterfall

The project combines an interactive web platform with AI algorithms (AI proctoring), which need continuous experimentation, testing, and incremental development. Agile suits this kind of work, for three reasons.

#item[Iterative development][The first sprint covers the core functions, content management and basic exams. Later sprints add the AI features gradually.]

#item[Fast adaptation to feedback][Feedback from teachers and students can shape the user interfaces based on actual usage.]

#item[Comparison with Waterfall][Waterfall is inflexible for projects like this one, which require careful research and experimentation on AI and model accuracy.]

= Draft review

The draft was checked against standard software engineering requirements.

#table(
  columns: (34%, 1fr),
  align: left,
  table.hline(stroke: 0.8pt),
  table.header(
    [_Item_], [_Assessment_],
    table.hline(stroke: 0.5pt),
  ),
  [Problem and idea],
  [The problem is realistically defined, and the AI solution is clear and feasible.],
  [Functional requirements],
  [Excellent. They are divided precisely by user type (student, teacher, parent) and by platform function.],
  [Non#[#sym.hyph.nobreak]functional requirements],
  [Still missing. Security, privacy, and responsiveness under high load during exams need to be added.],
  [Process model],
  [Agile suits the development lifecycle of AI and web projects.],
  table.hline(stroke: 0.8pt),
)
