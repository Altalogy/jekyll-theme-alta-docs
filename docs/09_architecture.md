## Architecture

You can write down all architecture:

a) in a single document: `_docs/0600_system/0611_architecture.md`
b) as a separated category: `_docs/0700_architecture.md`

### Content propositions

#### Diagram

The architecture diagram presenting how system components are connected.

1. Create a diagram as an image

2. Upload image to the `assets/images/{archotecture}.{png}`

3. Import to the document:

```md
![System overview](/assets/images/system_overview.png)
```



### Models

```md
---
title: Models
category: Architecture
layout: doc
order: 702
toc: true
---

{% include models/_models_list.html models=site.data.models %}
```




### Project tree

```md
---
title: React's project tree
category: Architecture
layout: doc
order: 750
toc: true
---

{% include guidelines/react/react_project_tree.md %}
```

```md
---
title: Ruby on Rails project tree
category: Architecture
layout: doc
order: 751
toc: true
---

{% include guidelines/rails/api_only_project_tree.md %}
```
