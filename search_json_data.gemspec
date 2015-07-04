# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'search_json_data/version'

Gem::Specification.new do |spec|
  spec.name          = "search_json_data"
  spec.version       = SearchJsonData::VERSION
  spec.authors       = ["Diego Hernán Piccinini Lagos"]
  spec.email         = ["diego@guiasrails.es"]
  spec.summary       = %q{Objective: Make this a json data searchable}
  spec.description   = %q{A search for Lisp Common should match a programming language named "Common Lisp"}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "shoulda-matchers", "~> 2.8"
  spec.add_development_dependency 'cucumber', "~> 2.0"
  spec.add_development_dependency 'rspec-expectations', "~> 3.3"
  spec.add_development_dependency 'yard', "~> 0.8.7"

end
