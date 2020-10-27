require 'liquid'
require 'uri'

# Capitalize all words of the input
module Jekyll
  module Indent
    def indent(times)
      return "  " * times
    end
  end
end

Liquid::Template.register_filter(Jekyll::Indent)
