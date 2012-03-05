# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rpm_contrib"
  s.version = "2.1.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bill Kayser", "Jon Guymon"]
  s.date = "2011-12-22"
  s.description = "Community contributed instrumentation for various frameworks based on\nthe New Relic Ruby monitoring gem newrelic_rpm.\n"
  s.email = "support@newrelic.com"
  s.extra_rdoc_files = ["CHANGELOG", "LICENSE", "README.md"]
  s.files = ["CHANGELOG", "LICENSE", "README.md"]
  s.homepage = "http://github.com/newrelic/rpm_contrib"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Contributed Instrumentation for New Relic RPM", "-m", "README.md"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Contributed Instrumentation for New Relic RPM"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<newrelic_rpm>, [">= 3.1.1"])
      s.add_runtime_dependency(%q<newrelic_rpm>, [">= 3.1.1"])
    else
      s.add_dependency(%q<newrelic_rpm>, [">= 3.1.1"])
      s.add_dependency(%q<newrelic_rpm>, [">= 3.1.1"])
    end
  else
    s.add_dependency(%q<newrelic_rpm>, [">= 3.1.1"])
    s.add_dependency(%q<newrelic_rpm>, [">= 3.1.1"])
  end
end
