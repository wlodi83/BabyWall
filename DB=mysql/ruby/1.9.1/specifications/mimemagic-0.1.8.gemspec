# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mimemagic"
  s.version = "0.1.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel Mendler"]
  s.date = "2009-05-09"
  s.email = ["mail@daniel-mendler.de"]
  s.homepage = "https://github.com/minad/mimemagic"
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "mimemagic"
  s.rubygems_version = "1.8.15"
  s.summary = "Mime detection by extension or content"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bacon>, [">= 0"])
    else
      s.add_dependency(%q<bacon>, [">= 0"])
    end
  else
    s.add_dependency(%q<bacon>, [">= 0"])
  end
end
