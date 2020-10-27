{% assign model = include.model %}

`app/queries/{{ model.name }}_query.rb`

```ruby
# frozen_string_literal: true

# {{ model.name | camelcase }} search query
class {{ model.name | camelcase }}Query
  # def initialize(params = {}, relation = {{ model.name | camelcase }}.left_outer_joins(
  #     :subscriptions
  #   ).preload(:acm_commodities, :acm_company, :acm_dot_numbers)
  #   )
  def initialize(params = {}, relation = {})
    @relation = relation
    @params = params
  end

  def all
    @relation
  end

  def search_{{ model.db_name }}
    # by_city
    # by_name(@params[:search])
    @relation
  end

  private

  # def by_city
  #   if @params[:city]
  #     @relation = @relation.where('{{ model.db_name}}.city ILIKE ?', "%#{@params[:city]}%")
  #   end
  # end
  #
  # def by_name(name)
  #   if name
  #     @relation = @relation.where('{{ model.db_name}}.name ILIKE ?', "%#{@params[:name]}%")
  #   end
  # end
end
```
