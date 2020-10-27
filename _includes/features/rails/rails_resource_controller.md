{% assign model = include.model %}
{% assign namespace = include.namespace %}

{% assign tab = 0 %}
{% capture namespace_modules %}{% for n in namespace %}
{{ tab | indent }}module {{ n | camelcase }}{% assign tab = tab | plus:1 %}{% endfor %}{% endcapture %}

```ruby
# frozen_string_literal: true

{{ namespace_modules }}{% capture _ %}{% increment tab %}{% endcapture %}
{{ tab | indent  }}# {{ model.db_name | capitalize }} controller{% assign tab = tab + '  ' %}
{{ tab | indent  }}class {{ model.db_name | camelcase }}Controller < BaseController
      resource_description do
        short '{{ model.db_name | capitalize }}'
        deprecated false
        description <<-DES
          {{ model.db_name | capitalize }} resource.
        DES
      end

      before_action :set_{{ model.name}}, except: [:index, :create]

      api :GET, '/{{ model.db_name }}', 'See {{ model.db_name }}'
      returns code: 200, desc: '{{ model.name | capitalize }} details' do
        property :status, String, desc: '200'
        property :message, String, desc: '{{ model.db_name | capitalize }} details'
        property :data, Hash, desc: '{{ model.db_name | capitalize }} data' do
          property :page, Integer
          property :total, Integer
          property :{{ model.db_name }}, Array do{% for field in model.fields %}
            property :{{ field.name }}, {{ field.type | camelcase }}{% endfor %}
            property :created_at, DateTime
            property :updated_at, DateTime
          end
        end
      end
      example <<-DES
      # Request:
      [GET] /{{ model.db_name }}/{:id}
      DES
      def index
        # TODO: Pagination and filters
        @{{ model.db_name }} = {{ model.name | camelcase }}.all
        send_response(200, 'List of {{ model.db_name | capitalize }}', nil, ActiveModel::Serializer::CollectionSerializer.new(@{{ model.db_name }}, serializer: {{ model.name | camelcase }}Serializer))
      end

      api :GET, '/{{ model.db_name }}/:id', 'See {{ model.name }} details'
      param :id, String, desc: 'ID of the invitation', required: true
      error code: 404, desc: 'NOT_FOUND'
      returns code: 200, desc: '{{ model.name | capitalize }} details' do
        property :status, String, desc: '200'
        property :message, String, desc: '{{ model.name | capitalize }} details'
        property :data, Hash, desc: '{{ model.name | capitalize }} data' do{% for field in model.fields %}
          property :{{ field.name }}, {{ field.type | camelcase }}{% endfor %}
          property :created_at, DateTime
          property :updated_at, DateTime
        end
      end
      example <<-DES
      # Request:
      [GET] /{{ model.db_name }}/{:id}
      DES
      def show
        send_response(200, '{{ model.name | capitalize }} details', nil, {{ model.name | camelcase }}Serializer.new(@{{ model.name }}))
      end

      api :POST, '/{{ model.db_name }}', 'Create {{ model.name }}'
      error code: 422, desc: 'RESOURCE_NOT_VALID'
      returns code: 200, desc: '{{ model.name | capitalize }} details' do
        property :status, String, desc: '200'
        property :message, String, desc: '{{ model.name | capitalize }} details'
        property :data, Hash, desc: '{{ model.name | capitalize }} data' do{% for field in model.fields %}
          property :{{ field.name }}, {{ field.type | camelcase }}{% endfor %}
          property :created_at, DateTime
          property :updated_at, DateTime
        end
      end
      example <<-DES
      # Request:
      [GET] /{{ model.db_name }}/{:id}
      DES
      def create
        # Add strong params
        @{{ model.name }} = {{ model.name | camelcase }}.new({{ model.name }}_params)
        if @{{ model.name }}.save
          send_response(200, '{{ model.name | capitalize }} details', nil, {{ model.name | camelcase }}Serializer.new(@{{ model.name }}))
        else
          send_response(422, '{{ model.name | capitalize }} error', 'RESOURCE_NOT_VALID', @{{ model.name }}.errors))
        end
      end

      api :PUT, '/{{ model.db_name }}/:id', 'Update {{ model.name }}'
      param :id, String, desc: 'ID of the invitation', required: true
      error code: 403, desc: 'RESOURCE_NOT_VALID'
      error code: 404, desc: 'NOT_FOUND'
      returns code: 200, desc: '{{ model.name | capitalize }} details' do
        property :status, String, desc: '200'
        property :message, String, desc: '{{ model.name | capitalize }} details'
        property :data, Hash, desc: '{{ model.name | capitalize }} data' do{% for field in model.fields %}
          property :{{ field.name }}, {{ field.type | camelcase }}{% endfor %}
          property :created_at, DateTime
          property :updated_at, DateTime
        end
      end
      example <<-DES
      # Request:
      [GET] /{{ model.db_name }}/{:id}
      DES
      def update
        # Add strong params
        @{{ model.name }} = {{ model.name | camelcase }}.assign_attributes({{ model.name }}_params)
        if @{{ model.name }}
          if @{{ model.name }}.save
            send_response(200, '{{ model.name | capitalize }} updated', nil, {{ model.name | camelcase }}Serializer.new(@{{ model.name }}))
          else
            send_response(403, '{{ model.name | capitalize }} error', 'RESOURCE_NOT_VALID', @{{ model.name }}))
          end
        else
          send_response(404, '{{ model.name | capitalize }} not found', 'NOT_FOUND', nil))
        end
      end

      api :DELETE, '/{{ model.db_name }}/:id', 'Delete {{ model.name }}'
      param :id, String, desc: 'ID of the invitation', required: true
      error code: 403, desc: 'RESOURCE_NOT_VALID'
      error code: 404, desc: 'NOT_FOUND'
      returns code: 200, desc: '{{ model.name | capitalize }} details' do
        property :status, String, desc: '200'
        property :message, String, desc: '{{ model.name | capitalize }} details'
        property :data, Hash, desc: '{{ model.name | capitalize }} data' do{% for field in model.fields %}
          property :{{ field.name }}, {{ field.type | camelcase }}{% endfor %}
          property :created_at, DateTime
          property :updated_at, DateTime
        end
      end
      example <<-DES
      # Request:
      [GET] /{{ model.db_name }}/{:id}
      DES
      def destroy
        if @{{ model.name }}
          if @{{ model.name }}.destroy
            send_response(200, '{{ model.name | capitalize }} deleted', nil, {{ model.name | camelcase }}Serializer.new(@{{ model.name }}))
          else
            send_response(403, '{{ model.name | capitalize }} error', 'RESOURCE_NOT_VALID', @{{ model.name }}.errors))
          end
        else
          send_response(404, '{{ model.name | capitalize }} not found', 'NOT_FOUND', nil))
        end
      end

      private

      def set_{{ model.name }}
        @{{ model.name }} = {{ model.name | camelcase }}.find(params['id'])
      end

      def {{ model.name }}_params
        params.require(:{{model.name}}).permit({% for f in model.fields %}:{{f.name}},{% endfor %})
      end

    end
  end
end

```
