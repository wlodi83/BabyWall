# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "client_side_validations"
  s.version = "3.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian Cardarella"]
  s.date = "2011-12-22"
  s.description = "Client Side Validations"
  s.email = ["bcardarella@gmail.com"]
  s.homepage = "https://github.com/bcardarella/client_side_validations"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Client Side Validations"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>, ["~> 3.1.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<bson_ext>, [">= 0"])
      s.add_development_dependency(%q<mongoid>, ["~> 2.0.0"])
      s.add_development_dependency(%q<mongo_mapper>, ["~> 0.9.0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<simple_form>, ["~> 1.5.0"])
      s.add_development_dependency(%q<formtastic>, ["~> 2.0.0"])
      s.add_development_dependency(%q<sinatra>, ["~> 1.0"])
      s.add_development_dependency(%q<shotgun>, [">= 0"])
      s.add_development_dependency(%q<thin>, [">= 0"])
      s.add_development_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug19>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.1.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<bson_ext>, [">= 0"])
      s.add_dependency(%q<mongoid>, ["~> 2.0.0"])
      s.add_dependency(%q<mongo_mapper>, ["~> 0.9.0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<simple_form>, ["~> 1.5.0"])
      s.add_dependency(%q<formtastic>, ["~> 2.0.0"])
      s.add_dependency(%q<sinatra>, ["~> 1.0"])
      s.add_dependency(%q<shotgun>, [">= 0"])
      s.add_dependency(%q<thin>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<ruby-debug19>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.1.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<bson_ext>, [">= 0"])
    s.add_dependency(%q<mongoid>, ["~> 2.0.0"])
    s.add_dependency(%q<mongo_mapper>, ["~> 0.9.0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<simple_form>, ["~> 1.5.0"])
    s.add_dependency(%q<formtastic>, ["~> 2.0.0"])
    s.add_dependency(%q<sinatra>, ["~> 1.0"])
    s.add_dependency(%q<shotgun>, [">= 0"])
    s.add_dependency(%q<thin>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<ruby-debug19>, [">= 0"])
  end
end
