# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "messagebus_ruby_api"
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Message Bus dev team"]
  s.date = "2012-01-20"
  s.description = "Allows you to use the Message Bus API "
  s.email = ["messagebus@googlegroups.com"]
  s.homepage = ""
  s.licenses = ["APACHE2"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "messagebus_ruby_api"
  s.rubygems_version = "1.8.15"
  s.summary = "Send email through the Message Bus service"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
