# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rackspace"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ricardo Aravena"]
  s.date = "2012-04-24"
  s.description = "A Ruby API to version 0.0.3 of the Rackspace Cloud Servers product specically to handle livetrials"
  s.email = "raravena80@yahoo.com"
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/rackspace.rb",
    "lib/rackspace/base.rb",
    "lib/rackspace/images.rb",
    "lib/rackspace/livetrialserver.rb",
    "lib/rackspace/parsearguments.rb",
    "lib/rackspace/servers.rb",
    "test/rackspace_listimages_test.rb",
    "test/rackspace_listservers_test.rb",
    "test/rackspace_livetrialserver_test.rb",
    "test/rackspace_servers_test.rb",
    "test/run_all_tests.rb"
  ]
  s.homepage = "https://github.com/raravena80/rackspace"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Cloud Servers Ruby API for Specific Account"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 0"])
    else
      s.add_dependency(%q<json>, [">= 0"])
    end
  else
    s.add_dependency(%q<json>, [">= 0"])
  end
end

