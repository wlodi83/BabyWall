# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "parallel_tests"
  s.version = "0.6.16"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Grosser"]
  s.date = "2012-01-13"
  s.email = "grosser.michael@gmail.com"
  s.executables = ["parallel_cucumber", "parallel_test", "parallel_spec"]
  s.files = ["bin/parallel_cucumber", "bin/parallel_test", "bin/parallel_spec"]
  s.homepage = "http://github.com/grosser/parallel_tests"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Run tests / specs / features in parallel"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<parallel>, [">= 0"])
    else
      s.add_dependency(%q<parallel>, [">= 0"])
    end
  else
    s.add_dependency(%q<parallel>, [">= 0"])
  end
end
