# -*- encoding: utf-8 -*-
lib = File.expand_path('lib/', File.dirname(__FILE__))
$:.unshift lib unless $:.include?(lib)

require 'country_list/version'

Gem::Specification.new do |spec|
  spec.name = 'country_list'
  spec.version = CountryList::VERSION

  spec.homepage = %q{https://github.com/turboladen/country_list}
  spec.authors = ['mm1', 'Steve Loveless']
  spec.summary = %q{List of all countries with names from ISO 3166-1 with iso alpha-2, iso alpha3 and numeric}
  spec.description = spec.summary
  spec.email = %w{steve.loveless@gmail.com}
  spec.licenses = %w{MIT}

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w[lib]

  spec.add_dependency 'globalize', '~> 4.0.0'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
