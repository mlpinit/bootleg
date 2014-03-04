# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bootleg/version'

Gem::Specification.new do |gem|
  gem.name          = "bootleg"
  gem.version       = Bootleg::VERSION
  gem.authors       = ["Marius L. Pop"]
  gem.email         = ["marius@mlpinit.com"]
  gem.description   = %q{ This gems allows you to navigate through the results }
  gem.summary       = %q{ Zipcode based scrapping for moviefone.com }
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'mechanize',         '~> 2.7.3'

  gem.add_development_dependency 'rspec', '~> 2.14.1'
end
