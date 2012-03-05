# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "em-synchrony"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ilya Grigorik"]
  s.date = "2010-10-30"
  s.description = "Fiber aware EventMachine libraries"
  s.email = ["ilya@igvita.com"]
  s.homepage = "http://github.com/igrigorik/em-synchrony"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9")
  s.rubyforge_project = "em-synchrony"
  s.rubygems_version = "1.8.15"
  s.summary = "Fiber aware EventMachine libraries"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<eventmachine>, [">= 0.12.9"])
    else
      s.add_dependency(%q<eventmachine>, [">= 0.12.9"])
    end
  else
    s.add_dependency(%q<eventmachine>, [">= 0.12.9"])
  end
end
