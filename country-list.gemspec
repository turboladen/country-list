# -*- encoding: utf-8 -*-
lib = File.expand_path('lib/', File.dirname(__FILE__))
$:.unshift lib unless $:.include?(lib)

require 'country-list/version'

Gem::Specification.new do |s|
  s.name = 'country-list-turboladen'
  s.version = CountryList::VERSION

  s.homepage = %q{https://github.com/turboladen/country-list}
  s.authors = ['mm1', 'Steve Loveless']
  s.summary = %q{List of all countries with names from ISO 3166-1 with iso alpha-2, iso alpha3 and numeric}
  s.description = s.summary
  s.email = %w{steve.loveless@gmail.com}
  s.licenses = %w{MIT}

  s.files         = `git ls-files`.split($/)
  s.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  s.require_paths = %w[lib]

  s.add_development_dependency 'bundler', '~> 1.3'
  s.add_development_dependency 'rake'
end
