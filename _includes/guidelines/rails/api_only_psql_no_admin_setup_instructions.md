{% assign project_name = 'project-name' %}
{% if include.project_name %}
  {% assign project_name = include.project_name %}
{% endif %}

*Ruby: 2.6.5, Rails: 6.0.3*

**Purpose:** Ruby on Rails API-only + PostgreSQL

### Prerequisites

* Ruby installed
* Rails installed
* Selected database installed (PostgreSQL, MySQL, etc.)

### A) Set up Ruby on Rails project

1. Create a project folder:

        $ mkdir {{ project_name }}-api && cd {{ project_name }}-api

2. Create Rails API-only project with PostgreSQL database:

        $ rails new . --api --database postgresql

3. Add gems:

```ruby
# Gemfile

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# API documentation
gem 'apipie-rails'

# Serializer
gem 'active_model_serializers', '~> 0.10.0'

# .ENV
gem 'dotenv-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Tests fixtures
  gem 'factory_bot_rails'
  # Tests coverage
  gem 'simplecov', require: false
  # Code analyzers
  gem 'rails_best_practices'
  gem 'rubocop-rails', require: false
  gem 'rubycritic', require: false

  gem 'minitest-hooks'
end

group :development do
  # Catch security vulnerabilities
  gem 'brakeman'
  # Catch N+1 queries and unused eager loading
  gem 'bullet'
end
```

Other optional gems:

```ruby
# Gemfile

# AWS SDK
gem 'aws-sdk', '~> 3'
gem 'aws-sdk-rails'

# HTTP requests
gem 'httparty'

# Support PostGIS
gem 'activerecord-postgis-adapter'

# UI
gem 'jquery-rails'
gem 'select2-rails'

```

<div>
4. Run:
</div>

      $ bundle install


### B) Set up environment variables with .ENV

1. Generate secret key:

        $ rake secret

2. Create `.env` file and add configuration:

        APP_DB_USERNAME=db_username
        APP_DB_PASSWORD=db_password
        APP_DB_HOSTNAME=127.0.0.1
        APP_DB_PORT=5432
        SECRET_KEY_BASE=<paste here secret generate in the previous step>

3. Create `.env` file template:

        $ dotenv -t .env

4. Add to `.gitignore`:

        # Environment variables
        .env
        .env.prod
        .env.dev

        # Ignore Simplecov tests coverage results
        coverage

        # Ignore RDoc
        doc

        # Ignore Breakman output
        brakeman_output.html

### C) Set up database and run project

1. Edit `config/database.yml`

        pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
        username: <%= ENV['APP_DB_USERNAME'] %>
        password: <%= ENV['APP_DB_PASSWORD'] %>
        port: <%= ENV['APP_DB_PORT'] %>
        host: <%= ENV['APP_DB_HOSTNAME'] %>

2. Create database and run migrations

        $ rake db:create
        $ rake db:migrate

3. Run project

        $ rails s
        # OR
        $ rails s -b xxx.xx.xxx.xx -p 4001

4. Open website in the web browser.

### D) Repository

1. Create a new project and/or repository on Bitbucket, GitHub, etc.

2. Run:

        $ git add .
        $ git commit -m "Ruby on Rails project setup."
        $ git remote add origin <add repository URL>
        $ git push -u origin master



### E) Edit README.md file

```markdown
{% include templates/rails/rails_readme.md project_name=project_name %}
```



### F) Set up project tree

Create folders and files in the project tree. Add empty `.keep` file to empty folders.

{% include guidelines/rails/api_only_project_tree_with_files.md %}


### G) Set up Gems and other


#### UUID

Add `config/initializers/generators.rb` file to set up database to use `uuid` as a primary key (ID):

```ruby
Rails.application.config.generators do |g|
  g.orm :active_record, primary_key_type: :uuid
end
```

Generate migration:

```bash
$ rails g migration enable_uuid
```

```ruby
class EnableUUID < ActiveRecord::Migration
  def change
    enable_extension 'pgcrypto'
  end
end
```


#### Apipie

Run:

```
$ rails g apipie:install
```

Edit `config/initializers/apipie.rb` file:

```ruby
Apipie.configure do |config|
  config.app_name                = '{{ project_name }}'
  config.api_base_url            = '/api/v1'
  config.doc_base_url            = '/api/docs'
  config.translate               = false
  config.default_locale          = 'en'
  config.languages               = ['en']
  config.layout                  = 'apipie'
  # where is your API defined?
  config.api_controllers_matcher = File.join(Rails.root, 'app', 'controllers', '**', '*.rb') # rubocop:disable Rails/FilePath
end
```

#### CORS

Add/edit `config/initializers/cors.rb` file:

```ruby
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'

    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head]
  end
end
```


***

After all, commit changes to the repository.
