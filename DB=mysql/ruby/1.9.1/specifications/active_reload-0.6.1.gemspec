# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "active_reload"
  s.version = "0.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Robert Pankowecki"]
  s.date = "2011-10-09"
  s.description = "Reload Rails code in development mode only when change is deteced"
  s.email = ["robert.pankowecki@gmail.com"]
  s.homepage = "https://github.com/paneq/active_reload"
  s.require_paths = ["lib"]
  s.rubyforge_project = "active_reload"
  s.rubygems_version = "1.8.15"
  s.summary = "Reload Rails code in development mode only when change is deteced"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<active_support>, [">= 0"])
      s.add_development_dependency(%q<bbq>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<active_support>, [">= 0"])
      s.add_dependency(%q<bbq>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<active_support>, [">= 0"])
    s.add_dependency(%q<bbq>, [">= 0"])
  end
end
