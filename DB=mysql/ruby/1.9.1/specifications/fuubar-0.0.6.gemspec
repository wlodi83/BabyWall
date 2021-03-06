# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "fuubar"
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nicholas Evans", "Jeff Kreeftmeijer"]
  s.date = "2011-08-08"
  s.description = "the instafailing RSpec progress bar formatter"
  s.email = ["jeff@kreeftmeijer.nl"]
  s.homepage = "https://github.com/jeffkreeftmeijer/fuubar"
  s.require_paths = ["lib"]
  s.rubyforge_project = "fuubar"
  s.rubygems_version = "1.8.15"
  s.summary = "the instafailing RSpec progress bar formatter"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec>, ["~> 2.0"])
      s.add_runtime_dependency(%q<ruby-progressbar>, ["~> 0.0.10"])
      s.add_runtime_dependency(%q<rspec-instafail>, ["~> 0.1.8"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.0"])
      s.add_dependency(%q<ruby-progressbar>, ["~> 0.0.10"])
      s.add_dependency(%q<rspec-instafail>, ["~> 0.1.8"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.0"])
    s.add_dependency(%q<ruby-progressbar>, ["~> 0.0.10"])
    s.add_dependency(%q<rspec-instafail>, ["~> 0.1.8"])
  end
end
