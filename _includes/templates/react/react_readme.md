{% assign project_name = 'project-name' %}
{% if include.project_name %}
  {% assign project_name = include.project_name %}
{% endif %}

## {{ project_name | capitalize }}

The web application for {{ project_name }} built with React.JS.


### Getting started

**Prerequisites:** Node.js and npm/yarn/npx already installed.

1. Download project (i.e. git clone)

2. Adjust environment variables in `src/config/*` files.

3. Install:

      $ yarn install

4. Start project

      $ yarn start


### Documentation

You can find more details about the project in docs repository: **{{ project_name}}-docs**

### Development

Follow instructions from [Getting started](#getting-started) to run project.

### Tests

TODO

### Deployment

TODO
