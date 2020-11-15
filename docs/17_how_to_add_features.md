## How to add features

Guidelines:

* one feature - one page
* features in docs should mirror features on Jira, Clickup, etc.
* doc should contain: Motivation (Why?) and Instructions (How?)
* features should be related to the one user story. ("Many" relation is also allowed, but not recommended)

### Instructions

1. Create file: `_docs/0900_features/0901_feature-name.md`

2. Add Frontmatter:

```md
---
title: Feature name
category: Features
layout: doc
order: 901
toc: true
status: planning
prio: high
system_components: [admin, api]
version: 1.0
---
```

### See more

1. [React](2100_react.md)
2. [Ruby on Rails](2200_ruby_on_rails.md)
