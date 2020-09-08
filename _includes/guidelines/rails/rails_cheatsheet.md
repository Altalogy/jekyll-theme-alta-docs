### Basic commands
---

#### Run project

``` bash
$ rails s
# OR
$ rails s -b xxx.xxx.xx.xx -p yyyy
```


#### Database

```bash
$ rake db:create
$ rake db:migrate
$ rake db:rollback
$ rake db:seed
```

#### Tests

TODO

#### Common tools, commands & scripts

```bash
# Rubocop
$ rubocop --require rubocop-rails
$ rubocop --require rubocop-rails -a  # with auto-correct
$ rubocop --auto-correct --only FrozenStringLiteralComment # To fix frozen_string_literal


# Rails best practices
$ rails_best_practices .

# Rubycritic
$ bundle exec rubycritic --no-browser -f console

# Breakman
$ brakeman -o brakeman_output.html


# Check also Bullet and code coverage with simplecov.
```


### Fixing issues
---

Some issues can be resolved by clearing the cache:

```bash
$ rake tmp:clear
```

... or restarting the spring:

```bash
$ spring stop
```


### Database login
---

```bash
# PostgreSQL
$ psql -U <user> -d <db_name> -h 127.0.0.1 -W

# MySQL
$ mysql -u <user> -h 127.0.0.1 -p <db_name>

```


### frozen_string_literal
---

Run following command to add `# frozen_string_literal: true` to all files:

```bash
$ bundle exec rubocop --auto-correct --only FrozenStringLiteralComment
```

### Gems
---

#### Apipie

[Learn more](https://github.com/Apipie/apipie-rails)

Apipie-rails is a DSL and Rails engine for documenting your RESTful API.

*Setup*

Run:

```bash
$ rails g apipie:install
```

Edit initializer: `config/initializers/apipie.rb`:

```ruby
Apipie.configure do |config|
  config.app_name                = 'project-name'
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

*Usage*

Add Apipie comments to controllers' actions:

```ruby
api :GET, '/user', 'Get user data'
error code: 401, desc: 'ERR_USER_UNAUTHORIZED: User is not authorized.'
returns code: 200, desc: 'User data' do
  property :status, String, desc: '200'
  property :message, String, desc: 'User data'
  property :data, Hash, desc: 'User data' do
    property :id, String
    property :email, String
    property :organization, Hash do
      property :id, String
      property :name, String
    end
  end
end
def show
  (...)
end
```

Then, open in the web browser: `/api/docs`.



#### Bullet

[Learn more](https://github.com/flyerhzm/bullet)

Helps to kill N+1 queries and unused eager loading

*Usage*

Bullet works by itself when server runs in development mode, logging warnings to the terminal and `/log/bullet.log`.


#### Byebug

[Learn more](https://github.com/deivid-rodriguez/byebug)

Ruby debugger.

*Usage*

Add `byebug` to the code:

```ruby
def index
  byebug
  @articles = Article.find_recent
end
```

**Basic commands**

|Command|Description|
|-------|-----------|
|c|Continue|
|q|Exit byebug|
|n|Next breakpoint|
|s|Next step (instruction)|



#### Serializers

[Learn more](https://github.com/rails-api/active_model_serializers)

Serializes the data in responses.

*Usage*

Create a file for a resource in `app/serializers/<my_resource>_serializer.rb`:

```ruby
# MyResource serializer
class MyResourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :color
end
```

You can serialize data manually:

```ruby
MyResourceSerializer.new(@resource)
```


#### SimpleCov

[Learn more](https://github.com/colszowka/simplecov)

SimpleCov is a code coverage analysis tool for Ruby.

*Usage*

Run `RAILS_ENV='test' rake tests:run` and check coverage statistics.

#### rails_best_practices

[Learn more](https://github.com/flyerhzm/rails_best_practices)

It is a code metric tool to check the quality of Rails code.

*Usage*

```
rails_best_practices .
```

#### Rubycritic

[Learn more](https://github.com/whitesmith/rubycritic)

A Ruby code quality reporter.

*Usage*

```
$ rubycritic
$ rubycritic --no-browser
$ rubycritic --no-browser -f console

$ bundle exec rubycritic --no-browser -f console
```

#### Rubocop

[Learn more](https://github.com/rubocop-hq/rubocop)

A Ruby static code analyzer and code formatter.

*Usage*

```
$ rubocop --require rubocop-rails

$ rubocop --require rubocop-rails -a  # with auto-correct
```

#### Breakman

[Learn more](https://github.com/presidentbeef/brakeman)

Brakeman is a static analysis tool which checks Ruby on Rails applications for security vulnerabilities.

*Usage*

```
$ brakeman

$ brakeman -o brakeman_output.html
```
