# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "cucumber-api-steps"
  s.version = "0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jay Zeschin"]
  s.date = "2011-10-05"
  s.description = "Cucumber steps to easily test REST-based XML and JSON APIs"
  s.email = ["jay.zeschin@factorylabs.com"]
  s.homepage = "http://github.com/jayzes/cucumber-api-steps"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Cucumber steps to easily test REST-based XML and JSON APIs"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jsonpath>, [">= 0.1.2"])
      s.add_runtime_dependency(%q<cucumber>, [">= 0.8.3"])
      s.add_development_dependency(%q<bueller>, [">= 0"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
    else
      s.add_dependency(%q<jsonpath>, [">= 0.1.2"])
      s.add_dependency(%q<cucumber>, [">= 0.8.3"])
      s.add_dependency(%q<bueller>, [">= 0"])
      s.add_dependency(%q<capybara>, [">= 0"])
    end
  else
    s.add_dependency(%q<jsonpath>, [">= 0.1.2"])
    s.add_dependency(%q<cucumber>, [">= 0.8.3"])
    s.add_dependency(%q<bueller>, [">= 0"])
    s.add_dependency(%q<capybara>, [">= 0"])
  end
end
