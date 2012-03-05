# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "omniauth-tumblr"
  s.version = "1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jamie Wilkinson"]
  s.date = "2011-12-01"
  s.description = "OmniAuth strategy for Tumblr"
  s.email = ["jamie@jamiedubs.com"]
  s.homepage = "https://github.com/jamiew/omniauth-tumblr"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "OmniAuth strategy for Tumblr"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<omniauth-oauth>, ["~> 1.0"])
    else
      s.add_dependency(%q<omniauth-oauth>, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<omniauth-oauth>, ["~> 1.0"])
  end
end
