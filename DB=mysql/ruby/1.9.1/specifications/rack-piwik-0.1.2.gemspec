# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rack-piwik"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Maxwell Salzberg"]
  s.date = "2012-01-05"
  s.description = "Simple Rack middleware for implementing piwik Analytics racking in your Ruby-Rack based project."
  s.email = ["maxwell@joindiaspora.com"]
  s.homepage = "https://github.com/leehambley/rack-google-analytics"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Rack middleware to inject the Piwik tracking code into outgoing responses. Adapted from rack-google-analytics"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
