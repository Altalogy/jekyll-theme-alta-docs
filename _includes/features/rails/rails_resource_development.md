
{% assign model_name = include.model_name %}
{% assign model = null %}

{% if include.model %}
  {% assign model = include.model %}
{% else %}
  {% for m in site.data.models %}
    {% if m.name == model_name %}
      {% assign model = m %}
      {% break %}
    {% endif %}
  {% endfor %}
{% endif %}

{% assign namespace = null %}

{% if include.namespace %}
  {% assign namespace = include.namespace %}
{% endif %}


### Model

{% include features/rails/rails_resource_model.md model=model %}


### Controller

{% include features/rails/rails_resource_controller.md model=model namespace=namespace %}


### Routes

{% include features/rails/rails_resource_routes.md model_name=model.db_name namespace=namespace %}


### Queries

{% include features/rails/rails_resource_query.md model=model %}


### Serializer

{% include features/rails/rails_resource_serializer.md model=model %}


### Tests

TODO
