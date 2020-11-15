## Project overview

The "Project overview" component renders data from `_config.yml`:

* `title`
* `doc_version`
* `description`
* `getting_started`
* `system_components`
* `links`

Props:

* `next_button` - URL for the "Get started!" button

Usage:

        {% include project_overview.html next_button="/docs/development/" %}

Example:

![Project overview](project_overview.png)


### Usage

1. Add to the `_config.yml`:

```yaml
title             : "Project documentation"

description: >-
  Project description

doc_version       : 1.0.0

getting_started: >-
  Take a look on the useful materials below.
  Start by checking "the System Overview" to get a big picture of the project.
  Don't forget to check "Development Guidelines".
  Find more by exploring navigation on the left.

links:
  repos:
    - name  : Web app repository
      icon  : "fab fa-github" # Use fontawesome v6
      url   : https://bitbucket.org/
    - name  : Backend repository
      icon  : "fab fa-bitbucket" # Use fontawesome v6
      url   : https://bitbucket.org/
    - name  : Docs repository
      icon  : "fab fa-gitlab" # Use fontawesome v6
      url   : https://bitbucket.org/
  useful:
    - name  : System overview
      icon  : "fas fa-project-diagram"
      url   : /architecture/
    - name  : Architecture
      icon  : "fas fa-clipboard-list"
      url   : /architecture/
    - name  : Development Guidelines
      icon  : "fas fa-pencil-alt"
      url   : /architecture/

```

2. Edit `/index.md`:

```md
---
layout: page
---

{% include project_overview.html next_button="/docs/system-overview/" %}
```

3. [Optional] Add system components. Create file: `_data/system_components.json`:


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
