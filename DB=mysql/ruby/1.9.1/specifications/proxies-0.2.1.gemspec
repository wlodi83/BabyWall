# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "proxies"
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jakub Ku\u{c5}\u{ba}ma"]
  s.date = "2010-09-25"
  s.description = "Proxies can even proxy other proxies"
  s.email = ["qoobaa@gmail.com"]
  s.homepage = "http://rubygems.org/gems/proxies"
  s.require_paths = ["lib"]
  s.rubyforge_project = "proxies"
  s.rubygems_version = "1.8.15"
  s.summary = "Proxies can even proxy other proxies"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<test-unit>, [">= 2"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<test-unit>, [">= 2"])
      s.add_dependency(%q<mocha>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<test-unit>, [">= 2"])
    s.add_dependency(%q<mocha>, [">= 0"])
  end
end
