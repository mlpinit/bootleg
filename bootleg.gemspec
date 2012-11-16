# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bootleg/version'

Gem::Specification.new do |gem|
  gem.name          = "bootleg"
  gem.version       = Bootleg::VERSION
  gem.authors       = ["Marius L. Pop"]
  gem.email         = ["marius@mlpinit.com"]
  gem.description   = %q{ Scraping theaters, movies, showtimes and other relevant data from movifone.com}
  gem.summary       = %q{ ...comming soon...}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency "nokogiri"
  gem.add_dependency "mechanize"
  gem.add_dependency "activerecord"
  gem.add_development_dependency "rspec"
end
