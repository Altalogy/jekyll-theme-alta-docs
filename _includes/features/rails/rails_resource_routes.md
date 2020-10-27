{% assign model_name = include.model_name %}
{% assign namespace = include.namespace %}

{% assign tab = 0 %}
{% capture namespace_modules %}{% for n in namespace %}
{{ tab | indent }}namespace :{{ n }} do{% assign tab = tab | plus:1 %}{% endfor %}{% endcapture %}

```ruby
{{ namespace_modules }}
    resources :{{ model_name}}
  end
end
```
