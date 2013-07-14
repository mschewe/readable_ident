# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'readable_ident/version'

Gem::Specification.new do |gem|
  gem.name          = "readable_ident"
  gem.version       = ReadableIdent::VERSION
  gem.authors       = ["Mark Schewe"]
  gem.email         = ["schewe.mark@gmail.com"]
  gem.description   = %q{Generates a readable ident for a given model}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/mschewe/readable_ident"
  gem.spec.licenses = "MIT"
  
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "activerecord"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "factory_girl"
  gem.add_development_dependency "debugger"
  gem.add_development_dependency "sqlite3"

end
