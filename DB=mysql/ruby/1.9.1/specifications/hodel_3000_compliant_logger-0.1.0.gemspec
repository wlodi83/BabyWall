# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "hodel_3000_compliant_logger"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Geoffrey Grosenbach"]
  s.date = "2010-09-30"
  s.description = "Alternate logger for Rails that emits syslog-style output. For use with pl_analyze gem."
  s.email = "boss@topfunky.com"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://github.com/topfunky/hodel_3000_compliant_logger"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Alternate logger for Rails that emits syslog-style output. For use with pl_analyze gem."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 1.3.0"])
    else
      s.add_dependency(%q<rspec>, ["~> 1.3.0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 1.3.0"])
  end
end