# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "faraday-stack"
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mislav Marohni\u{107}"]
  s.date = "2012-01-10"
  s.email = "mislav.marohnic@gmail.com"
  s.homepage = "https://github.com/mislav/faraday-stack"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Great Faraday stack for consuming all kinds of APIs"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>, ["< 0.8", ">= 0.6"])
    else
      s.add_dependency(%q<faraday>, ["< 0.8", ">= 0.6"])
    end
  else
    s.add_dependency(%q<faraday>, ["< 0.8", ">= 0.6"])
  end
end
