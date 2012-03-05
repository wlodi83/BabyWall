# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "fixture_builder"
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Dy", "David Stevenson"]
  s.date = "2011-09-19"
  s.description = "FixtureBuilder allows testers to use their existing factories, like FactoryGirl, to generate high performance fixtures that can be shared across all your tests"
  s.email = "mail@ryandy.com"
  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["README.markdown"]
  s.homepage = "http://github.com/rdy/fixture_builder"
  s.require_paths = ["lib"]
  s.rubyforge_project = "fixture_builder"
  s.rubygems_version = "1.8.15"
  s.summary = "Build YAML fixtures using object factories"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 2"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2"])
      s.add_development_dependency(%q<rake>, ["= 0.8.7"])
      s.add_development_dependency(%q<test-unit>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, [">= 2"])
      s.add_dependency(%q<activesupport>, [">= 2"])
      s.add_dependency(%q<rake>, ["= 0.8.7"])
      s.add_dependency(%q<test-unit>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 2"])
    s.add_dependency(%q<activesupport>, [">= 2"])
    s.add_dependency(%q<rake>, ["= 0.8.7"])
    s.add_dependency(%q<test-unit>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end
