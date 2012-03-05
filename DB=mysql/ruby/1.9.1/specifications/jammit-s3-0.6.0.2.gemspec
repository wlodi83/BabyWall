# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jammit-s3"
  s.version = "0.6.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jacques Crocker"]
  s.date = "2011-03-18"
  s.description = "    Jammit-S3 is an extension to the awesome Jammit library that handles deployment to s3 and cloudfront.\n"
  s.email = "railsjedi@gmail.com"
  s.executables = ["jammit-s3"]
  s.files = ["bin/jammit-s3"]
  s.homepage = "http://documentcloud.github.com/jammit/"
  s.require_paths = ["lib"]
  s.rubyforge_project = "jammit-s3"
  s.rubygems_version = "1.8.15"
  s.summary = "Asset Packaging for Rails with Deployment to S3/Cloudfront"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jammit>, [">= 0.5.4"])
      s.add_runtime_dependency(%q<mimemagic>, [">= 0.1.7"])
      s.add_runtime_dependency(%q<s3>, [">= 0.3.7"])
    else
      s.add_dependency(%q<jammit>, [">= 0.5.4"])
      s.add_dependency(%q<mimemagic>, [">= 0.1.7"])
      s.add_dependency(%q<s3>, [">= 0.3.7"])
    end
  else
    s.add_dependency(%q<jammit>, [">= 0.5.4"])
    s.add_dependency(%q<mimemagic>, [">= 0.1.7"])
    s.add_dependency(%q<s3>, [">= 0.3.7"])
  end
end
