## Epics & user stories

Epics and user stories are text-based documents. You write documents in a one category: `Epics & user stories`, or you can separate them: `Epics` + `User stories`.

## Instructions

1. Create folder: `_docs/0300_epics_user_stories`, or create two folders: `_docs/0300_epics` and `_docs/0350_user_stories`.

2. For each epic and user story, create a new file: `_docs/0300_epics_user_stories/0301_my_epic.md`.

### Epics

```md
---
title: My epic
category: Epics & user stories # or: "Epics", "User stories"
layout: doc
order: 301
toc: true
vtag: epic  # or user story
---

Write the epic.

```

#### Tags

You can use single tag:

```md
vtag: epic
```

...or array of tags:

```md
vtags: [user story, auth]
```


#### Other badges

You can also use following fields in the frontmatter:

```md
status: done
version: 1.0.0
prio: high
```
