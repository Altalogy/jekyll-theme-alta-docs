## Techstack

### Usage

1. Create file: `_docs/0600_system/_0610_techstack.md`

2. Add to the file:

```md
---
title: Techstack
category: System
layout: doc
order: 610
toc: true
---

{% include system_components_overview.html %}
```

3. Add system components with `techs` to: `_data/system_components.json`

```json
[
  {
    "name": "Frontend",
    "techs" : [
      { "name": "React.js" },
      { "name": "Redux" }
    ]
  },
  {
    "name": "Backend",
    "techs": [
      { "name": "Ruby on Rails" }
    ]
  },
  {
    "name": "Database",
    "techs": [
      { "name": "PostgreSQL" }
    ]
  },
  {
    "name": "Service provider",
    "techs": [
      { "name": "AWS" }
    ]
  }
]
```
