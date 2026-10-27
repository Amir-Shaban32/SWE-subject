# Smart Exam Platform with AI Proctoring

Software Engineering course project, Section 2.
Development methodology: Agile.

## Overview

This repository holds the project documentation for a smart exam platform
for teachers and students. The platform combines a learning environment,
an exam system, AI-based proctoring, and an automatic results dashboard,
so that teachers no longer depend on manual tools such as spreadsheets.

The documents are written in [Typst](https://typst.app) so that they stay
as plain text, can be reviewed in pull requests, and can be compiled to PDF
at any time.

**New documents will be added to this structure as the semester progresses
and this section will be updated with them.**

## Documents

### swe_task.typ

The first deliverable. It currently contains:

1. Problem and idea
2. System requirements (general, functional by role, non-functional draft)
3. Methodology: Agile versus Waterfall
4. Draft review

## Getting Started

### Requirements

- [Typst](https://github.com/typst/typst) 0.13 or later (the document was
  built with 0.15)
- Alternatively, the Typst web app at <https://typst.app>

### Build

Compile the document to PDF:

```
typst compile swe_task.typ
```

Recompile automatically on every save while editing:

```
typst watch swe_task.typ
```

The output is written next to the source as `swe_task.pdf`.

## Project Status

| Area                         | Status      |
| ---------------------------- | ----------- |
| Problem and idea             | Complete    |
| Functional requirements      | Complete    |
| Non-functional requirements  | In progress |
| Process model                | Complete    |

Later deliverables (design, implementation, testing) will be added here
as each phase of the course is covered.
