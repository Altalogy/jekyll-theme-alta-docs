## Project's meta

```yaml
theme             : "jekyll-theme-alta-docs"
title             : "Project title"
description: >- # this means to ignore newlines until "baseurl:"
  The project description.
baseurl: "" # the subpath of your site, e.g. /blog
url: "" # the base hostname & protocol for your site, e.g. http://example.com

getting_started   : >-    # Used in the Project overview component
  Take a look on the useful materials below.
  Start by checking "the System Overview" to get a big picture of the project.
  Don't forget to check "Development Guidelines".
  Find more by exploring navigation on the left.

collections:
  docs:
    output: true
    permalink: /:collection/:name/

doc_collection    : docs
doc_version       : 1.0.0 # Versioning of the documentation

```
