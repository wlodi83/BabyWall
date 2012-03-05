# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jasmine"
  s.version = "1.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rajan Agaskar", "Christian Williams", "Davis Frank"]
  s.date = "2011-10-27"
  s.description = "Test your JavaScript without any framework dependencies, in any environment, and with a nice descriptive syntax."
  s.email = "jasmine-js@googlegroups.com"
  s.executables = ["jasmine"]
  s.files = ["bin/jasmine"]
  s.homepage = "http://pivotal.github.com/jasmine"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "JavaScript BDD framework"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 2.5.0"])
      s.add_development_dependency(%q<rails>, [">= 3.0.0"])
      s.add_development_dependency(%q<rack>, [">= 1.2.1"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
      s.add_development_dependency(%q<ci_reporter>, [">= 0"])
      s.add_development_dependency(%q<json_pure>, [">= 0"])
      s.add_runtime_dependency(%q<jasmine-core>, [">= 1.1.0"])
      s.add_runtime_dependency(%q<rack>, [">= 1.1"])
      s.add_runtime_dependency(%q<rspec>, [">= 1.3.1"])
      s.add_runtime_dependency(%q<selenium-webdriver>, [">= 0.1.3"])
    else
      s.add_dependency(%q<rspec>, [">= 2.5.0"])
      s.add_dependency(%q<rails>, [">= 3.0.0"])
      s.add_dependency(%q<rack>, [">= 1.2.1"])
      s.add_dependency(%q<rack-test>, [">= 0"])
      s.add_dependency(%q<ci_reporter>, [">= 0"])
      s.add_dependency(%q<json_pure>, [">= 0"])
      s.add_dependency(%q<jasmine-core>, [">= 1.1.0"])
      s.add_dependency(%q<rack>, [">= 1.1"])
      s.add_dependency(%q<rspec>, [">= 1.3.1"])
      s.add_dependency(%q<selenium-webdriver>, [">= 0.1.3"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 2.5.0"])
    s.add_dependency(%q<rails>, [">= 3.0.0"])
    s.add_dependency(%q<rack>, [">= 1.2.1"])
    s.add_dependency(%q<rack-test>, [">= 0"])
    s.add_dependency(%q<ci_reporter>, [">= 0"])
    s.add_dependency(%q<json_pure>, [">= 0"])
    s.add_dependency(%q<jasmine-core>, [">= 1.1.0"])
    s.add_dependency(%q<rack>, [">= 1.1"])
    s.add_dependency(%q<rspec>, [">= 1.3.1"])
    s.add_dependency(%q<selenium-webdriver>, [">= 0.1.3"])
  end
end
