# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mobile-fu"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brendan Lim", "Ben Langfeld"]
  s.date = "2012-01-21"
  s.description = "Want to automatically detect mobile devices that access your Rails application? Mobile Fu allows you to do just that. People can access your site from a Palm, Blackberry, iPhone, iPad, Nokia, etc. and it will automatically adjust the format of the request from :html to :mobile."
  s.email = ["brendangl@gmail.com, ben@langfeld.me"]
  s.homepage = "https://github.com/benlangfeld/mobile-fu"
  s.require_paths = ["lib"]
  s.rubyforge_project = "mobile-fu"
  s.rubygems_version = "1.8.15"
  s.summary = "Automatically detect mobile requests from mobile devices in your Rails application."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 0"])
      s.add_runtime_dependency(%q<rack-mobile-detect>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 0"])
      s.add_dependency(%q<rack-mobile-detect>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 0"])
    s.add_dependency(%q<rack-mobile-detect>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
  end
end
