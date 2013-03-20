# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'platidoma/version'

Gem::Specification.new do |gem|
  gem.name          = "platidoma"
  gem.version       = Platidoma::VERSION
  gem.authors       = ["Panfilov Denis", "Frank Alexey"]
  gem.email         = ["panf.denis@gmail.com", "alexeyfrank@gmail.com"]
  gem.description   = %q{Platidoma.ru API}
  gem.summary       = %q{platidoma}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "weary", '1.1.2'
  gem.add_runtime_dependency "addressable"
  gem.add_runtime_dependency "happymapper"


end
