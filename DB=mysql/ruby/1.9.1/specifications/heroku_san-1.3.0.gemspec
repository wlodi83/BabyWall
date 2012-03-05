# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "heroku_san"
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Elijah Miller", "Glenn Roberts", "Ryan Ahearn"]
  s.date = "2011-11-07"
  s.description = "Manage multiple Heroku instances/apps for a single Rails app using Rake"
  s.email = "elijah.miller@gmail.com"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://github.com/glennr/heroku_san"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "A bunch of useful Rake tasks for managing your Heroku apps"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 2"])
      s.add_runtime_dependency(%q<heroku>, [">= 2"])
      s.add_development_dependency(%q<rails>, [">= 3"])
      s.add_development_dependency(%q<aruba>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 2"])
      s.add_dependency(%q<heroku>, [">= 2"])
      s.add_dependency(%q<rails>, [">= 3"])
      s.add_dependency(%q<aruba>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 2"])
    s.add_dependency(%q<heroku>, [">= 2"])
    s.add_dependency(%q<rails>, [">= 3"])
    s.add_dependency(%q<aruba>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
  end
end
