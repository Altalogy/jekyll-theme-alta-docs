# Jekyll Theme: Alta Docs Theme

The Jekyll theme for documenting software development projects.

![Screenshot](screenshot.png)

## Basic usage

### New Jekyll project

1. Install Jekyll

        gem install bundler jekyll

2. Create Jekyll project:

        jekyll new my-project

3. Go to the project:

        cd my-project

4. Run:

        bundle exec jekyll serve
        # OR
        bundle exec jekyll serve --host xxx.xx.xxx.xx --port 4001

### Use jekyll-theme-alta-docs

1. Change `Gemfile`

        # gem "minima", "~> 2.5" # <-- Remove or comment
        gem "jekyll-theme-alta-docs" # <--- Add

2. Run:

        $ bundle install

3. Create *_docs/* folder

4. Edit `_config.yml`:

        # Set new theme:
        theme: jekyll-theme-alta-docs

        # Register new collection "docs" from "_docs" folder:
        collections:
          docs:
            output: true
            permalink: /:collection/:name/

        # Bind your "docs" collection
        doc_collection    : docs

5. Add markdown files to the `_docs/` folder:

        # _docs/01_intro/getting_started.md
        ---
        title: Getting started  # Enter any name
        category: Intro # Enter any category. Categories are used to group docs.
        layout: doc # Important! Use doc layout
        toc: true # Optional: to display table of contents
        order: 11 # To sort the documents in the navigation
        ---

        ## Getting started

        Hello world!

6. Add `index.md` in the root directory (Home page):

        # index.md
        ---
        layout: page
        ---

        # Home page

        This is my home page

7. Run:

        bundle exec jekyll serve

### What's next?

Add more documents in *_docs* folder and see [advanced options](#advanced-options).


## Advanced options

### Common _config.yml options

        title             : "Project title"

        getting_started   : >-    # Used in the Project overview component
          Take a look on the useful materials below.
          Start by checking "the System Overview" to get a big picture of the project.
          Don't forget to check "Development Guidelines".
          Find more by exploring navigation on the left.



### Links

Links to the repositories can be added in *_config.yml*:

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

Repositories links are displayed in website footer.


### System components

You can define the system components like Backend, Frontend etc. in *_config.yml*:

        system_components:
          - name  : Frontend
            techs :
              - name: React.js
              - name: Redux
          - name  : Backend
            techs :
              - name: Ruby on Rails
          - name  : Database
            techs :
              - name: PostgreSQL
          - name  : Service provider
            techs :
              - name: AWS

The "System components" are used in two components:

* `project_overview.html` > `{% include project_overview.html %}`
* `system_components_overview.html` > `{% include project_overview.html %}`


### Versioning

The documentation version is displayed in the footer.

        doc_version       : 1.0.0


## Components (includes)

### Project overview

The "Project overview" component renders:

* `project_title`
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

![Project overview](docs/project_overview.png)


## Development

To set up your environment to develop this theme, run `bundle install`.

To test theme, run: `bundle exec rake preview` or `bundle exec rake preview host=xxx.xx.xxx.xx`


## License

The theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
