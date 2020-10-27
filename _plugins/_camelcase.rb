require 'liquid'
require 'uri'

# Capitalize all words of the input
module Jekyll
  module CamelCase
    def camelcase(word)
      return word.split(/[\s_]/).map(&:capitalize).join('')
    end
  end
end

Liquid::Template.register_filter(Jekyll::CamelCase)
