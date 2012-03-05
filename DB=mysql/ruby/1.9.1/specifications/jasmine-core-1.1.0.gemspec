# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jasmine-core"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rajan Agaskar", "Davis Frank", "Christian Williams"]
  s.date = "2011-09-10"
  s.description = "Test your JavaScript without any framework dependencies, in any environment, and with a nice descriptive syntax."
  s.email = "jasmine-js@googlegroups.com"
  s.homepage = "http://pivotal.github.com/jasmine"
  s.require_paths = ["lib"]
  s.rubyforge_project = "jasmine-core"
  s.rubygems_version = "1.8.15"
  s.summary = "JavaScript BDD framework"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<term-ansicolor>, [">= 0"])
      s.add_development_dependency(%q<json_pure>, [">= 1.4.3"])
      s.add_development_dependency(%q<frank>, [">= 0"])
      s.add_development_dependency(%q<ragaskar-jsdoc_helper>, [">= 0"])
    else
      s.add_dependency(%q<term-ansicolor>, [">= 0"])
      s.add_dependency(%q<json_pure>, [">= 1.4.3"])
      s.add_dependency(%q<frank>, [">= 0"])
      s.add_dependency(%q<ragaskar-jsdoc_helper>, [">= 0"])
    end
  else
    s.add_dependency(%q<term-ansicolor>, [">= 0"])
    s.add_dependency(%q<json_pure>, [">= 1.4.3"])
    s.add_dependency(%q<frank>, [">= 0"])
    s.add_dependency(%q<ragaskar-jsdoc_helper>, [">= 0"])
  end
end
