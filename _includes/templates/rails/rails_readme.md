{% assign project_name = 'project-name' %}
{% if include.project_name %}
  {% assign project_name = include.project_name %}
{% endif %}

## {{ project_name | capitalize }}

The API for {{ project_name }} built with Ruby on Rails.


### Getting started

**Prerequisites:** Ruby, Rails and PostgreSQL are already installed on the machine.

1. Download project (i.e. git clone)

2. Set up environment variables with `dotenv`:
  2.1 Copy-paste `.env.template` and rename to `.env`.
  2.2 Open `.env` and set environment variables.

2. Install gems:

      $ bundle install

3. Set up database:

      $ rake db:create
      $ rake db:migrate
      $ rake db:seed

4. Run project

      $ rails s
      # OR
      $ rails s -b xxx.xx.xxx.xx -p 4001


### Documentation

You can find more details about the project in docs repository: **{{ project_name}}-docs**

### Development

Follow instructions from [Getting started](#getting-started) to run project.

### Tests

TODO

### Deployment

TODO
