# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "webmock"
  s.version = "1.6.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bartosz Blimke"]
  s.date = "2011-01-12"
  s.description = "WebMock allows stubbing HTTP requests and setting expectations on HTTP requests."
  s.email = "bartosz.blimke@gmail.com"
  s.extra_rdoc_files = ["LICENSE", "README.md"]
  s.files = ["LICENSE", "README.md"]
  s.homepage = "http://github.com/bblimke/webmock"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Library for stubbing HTTP requests in Ruby."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<addressable>, [">= 2.2.2"])
      s.add_runtime_dependency(%q<crack>, [">= 0.1.7"])
      s.add_development_dependency(%q<rspec>, [">= 2.0.0"])
      s.add_development_dependency(%q<httpclient>, [">= 2.1.5.2"])
      s.add_development_dependency(%q<patron>, [">= 0.4.9"])
      s.add_development_dependency(%q<em-http-request>, [">= 0.2.14"])
      s.add_development_dependency(%q<curb>, [">= 0.7.8"])
    else
      s.add_dependency(%q<addressable>, [">= 2.2.2"])
      s.add_dependency(%q<crack>, [">= 0.1.7"])
      s.add_dependency(%q<rspec>, [">= 2.0.0"])
      s.add_dependency(%q<httpclient>, [">= 2.1.5.2"])
      s.add_dependency(%q<patron>, [">= 0.4.9"])
      s.add_dependency(%q<em-http-request>, [">= 0.2.14"])
      s.add_dependency(%q<curb>, [">= 0.7.8"])
    end
  else
    s.add_dependency(%q<addressable>, [">= 2.2.2"])
    s.add_dependency(%q<crack>, [">= 0.1.7"])
    s.add_dependency(%q<rspec>, [">= 2.0.0"])
    s.add_dependency(%q<httpclient>, [">= 2.1.5.2"])
    s.add_dependency(%q<patron>, [">= 0.4.9"])
    s.add_dependency(%q<em-http-request>, [">= 0.2.14"])
    s.add_dependency(%q<curb>, [">= 0.7.8"])
  end
end
