# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "oauth2-provider"
  s.version = "0.0.19"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tom Ward"]
  s.date = "2011-09-05"
  s.description = "OAuth2 Provider, extracted from api.hashblue.com"
  s.email = ["tom@popdog.net"]
  s.homepage = "http://tomafro.net"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "OAuth2 Provider, extracted from api.hashblue.com"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, ["~> 3.0"])
      s.add_runtime_dependency(%q<addressable>, ["~> 2.2"])
      s.add_development_dependency(%q<rack-test>, ["~> 0.5.7"])
      s.add_development_dependency(%q<activerecord>, ["~> 3.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.1.0"])
      s.add_development_dependency(%q<mocha>, ["~> 0.9.12"])
      s.add_development_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_development_dependency(%q<sqlite3-ruby>, ["~> 1.3.1"])
      s.add_development_dependency(%q<timecop>, ["~> 0.3.4"])
      s.add_development_dependency(%q<yajl-ruby>, ["~> 0.7.5"])
      s.add_development_dependency(%q<mongoid>, ["= 2.0.0.rc.6"])
      s.add_development_dependency(%q<bson>, ["= 1.2.0"])
      s.add_development_dependency(%q<bson_ext>, ["= 1.2.0"])
    else
      s.add_dependency(%q<activesupport>, ["~> 3.0"])
      s.add_dependency(%q<addressable>, ["~> 2.2"])
      s.add_dependency(%q<rack-test>, ["~> 0.5.7"])
      s.add_dependency(%q<activerecord>, ["~> 3.0"])
      s.add_dependency(%q<rspec>, ["~> 2.1.0"])
      s.add_dependency(%q<mocha>, ["~> 0.9.12"])
      s.add_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_dependency(%q<sqlite3-ruby>, ["~> 1.3.1"])
      s.add_dependency(%q<timecop>, ["~> 0.3.4"])
      s.add_dependency(%q<yajl-ruby>, ["~> 0.7.5"])
      s.add_dependency(%q<mongoid>, ["= 2.0.0.rc.6"])
      s.add_dependency(%q<bson>, ["= 1.2.0"])
      s.add_dependency(%q<bson_ext>, ["= 1.2.0"])
    end
  else
    s.add_dependency(%q<activesupport>, ["~> 3.0"])
    s.add_dependency(%q<addressable>, ["~> 2.2"])
    s.add_dependency(%q<rack-test>, ["~> 0.5.7"])
    s.add_dependency(%q<activerecord>, ["~> 3.0"])
    s.add_dependency(%q<rspec>, ["~> 2.1.0"])
    s.add_dependency(%q<mocha>, ["~> 0.9.12"])
    s.add_dependency(%q<rake>, ["~> 0.9.2"])
    s.add_dependency(%q<sqlite3-ruby>, ["~> 1.3.1"])
    s.add_dependency(%q<timecop>, ["~> 0.3.4"])
    s.add_dependency(%q<yajl-ruby>, ["~> 0.7.5"])
    s.add_dependency(%q<mongoid>, ["= 2.0.0.rc.6"])
    s.add_dependency(%q<bson>, ["= 1.2.0"])
    s.add_dependency(%q<bson_ext>, ["= 1.2.0"])
  end
end
