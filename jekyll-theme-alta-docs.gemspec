# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-alta-docs"
  spec.version       = "0.1.0"
  spec.authors       = ["Tom Antas"]
  spec.email         = ["tom@altalogy.com"]

  spec.summary       = "Dev docs theme."
  spec.homepage      = "http://altalogy.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.0"

  # spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.4"
  spec.add_runtime_dependency "jekyll-toc", "~> 0.14"
end
