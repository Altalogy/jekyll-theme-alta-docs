# Jekyll Theme: Alta Docs Theme

The Jekyll theme for documenting development projects.

## Basic usage

1. Add the theme to the `Gemfile`
```
gem "jekyll-theme-alta-docs"
```

2. Run `bundle install`

3. Add `index.html` page to the root directory (the *Getting started* page).

4. Create a folder your *docs* collection, i.e. `_docs/`

5. Set up the `_config.yml`

        doc_collection    : docs
        doc_version       : 1.0.0
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


## Development

To set up your environment to develop this theme, run `bundle install`.

To test theme, run: `bundle exec rake preview` or `bundle exec rake preview host=xxx.xx.xxx.xx`

## License

The theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
