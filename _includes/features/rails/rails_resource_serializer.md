{% assign model = include.model %}


`app/serializers/{{model.name}}_serializer.rb`

```ruby
# frozen_string_literal: true

# {{ model.name | camelcase }} serializer
class {{ model.name | camelcase }}Serializer < ActiveModel::Serializer
  attributes {% for f in model.fields %}:{{ f.name}},{% endfor %}


  # belongs_to :resource
  # has_many :resource

  # def lat
  #   object.latlng.lat || nil
  # end
  #
  # def lng
  #   object.latlng.lon || nil
  # end
end

```
