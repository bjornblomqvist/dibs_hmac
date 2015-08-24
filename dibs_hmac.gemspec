# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: dibs_hmac 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "dibs_hmac"
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Bj\u{f6}rn Blomqvist"]
  s.date = "2015-08-24"
  s.description = "An implementation of DIBS Message authentication code. Has correct sorting and rules for which params to include. So far it only includes the params for DIBS Payment Window."
  s.email = "bjorn@bjornblomqvist.se"
  s.extra_rdoc_files = [
    "CHANGELOG.md",
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    "CHANGELOG.md",
    "Gemfile",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "dibs_hmac.gemspec",
    "lib/dibs/hmac.rb",
    "lib/dibs_hmac.rb",
    "spec/dibs/hmac_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/bjornblomqvist/dibs_hmac"
  s.licenses = ["LGPL"]
  s.rubygems_version = "2.4.6"
  s.summary = "An implementation of DIBS Message authentication code."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.8"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.8"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.8"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8"])
  end
end

