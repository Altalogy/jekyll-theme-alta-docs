
{% assign model=include.model %}

{% include models/_model.html model=model %}

### Generate model

{% capture model_fields_cmd %}{% for field in model.fields %}{% if field.name != "id" %}{% if field.references %}{{ field.name | remove: '_id' }}:references {% else %}{{ field.name }}:{{ field.type }} {% endif %}{% endif %}{% endfor %}{% endcapture %}

```bash
$ rails g model {{ model.name | capitalize }} {{ model_fields_cmd }}
```

Migration:

{% capture model_migration_file %}{% for field in model.fields %}
      {% if field.references %}t.references :{{ field.name }}, foreign_key: true, type: :uuid{% if !field.references_optional %}, null: true{% endif %}{% else %}{% if field.name != "id" %}t.{{ field.type }} :{{ field.name }}{% endif %}{% if field.default %}, default: {{ field.default}}{% endif %}{% endif %}{% endfor %}{% endcapture %}

```ruby
# frozen_string_literal: true

# Creates User Identities
class Create{{ model.db_name | capitalize }} < ActiveRecord::Migration[6.0]
  def change
    create_table :{{ model.db_name }}, id: :uuid do |t|
      {{ model_migration_file }}

      t.timestamps
    end
  end
end
```

### models/{{ model.name | capitalize }}.rb

{% capture model_relations %}{% for r in model.relations %}
  {{ r.type }}: {{ r.resource }}{% if r.optional %}, optional: true{% endif %}{% endfor %}{% endcapture %}

{% capture model_validations %}{% for r in model.validations %}
  validates :{{ r.field }}{% if r.presence %}, presence: true{% endif%}{% endfor %}{% endcapture %}

{% capture model_enums %}{% for r in model.fields %}{% if r.enum %}
  enum {{ r.name }}: { {% for e in r.enum_values %}
    {{ e.val }}: {{e.key}},{% endfor %}
  }{% endif %}{% endfor %}{% endcapture %}

```ruby
# frozen_string_literal: true

# {{ model.name | capitalize }} model
class {{ model.name | capitalize }} < ApplicationRecord
  {{ model_validations }}
  {{ model_relations }}
  {{ model_enums }}

end
```
