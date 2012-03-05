# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "resque-timeout"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeff Gran"]
  s.date = "2011-03-07"
  s.description = "Resque plugin allowing long-running jobs to automatically fail after a specified time."
  s.email = "jeff.gran@gmail.com"
  s.extra_rdoc_files = ["README.md"]
  s.files = ["README.md"]
  s.homepage = "http://github.com/jeffgran/resque-timeout"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Timeout for long-running jobs in Resque"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<resque>, ["~> 1.0"])
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<resque>, ["~> 1.0"])
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<resque>, ["~> 1.0"])
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end
