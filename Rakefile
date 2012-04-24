require 'rubygems'
require './lib/rackspace.rb'
require 'rake/testtask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "rackspace"
    gemspec.summary = "Cloud Servers Ruby API for Specific Account"
    gemspec.description = "A Ruby API to version 0.0.3 of the Rackspace Cloud Servers product specically to handle livetrials" 
    gemspec.email = "raravena80@yahoo.com"
    gemspec.homepage = "https://github.com/raravena80/rackspace"
    gemspec.authors = ["Ricardo Aravena"]
    gemspec.add_dependency 'json'
    gemspec.files.include %w{
                             Rakefile
                             README.rdoc
                             lib/**/*
                             test/* }

  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

Rake::TestTask.new(:test) do |t|
    t.pattern = 'test/*_test.rb'
    t.verbose = true
end
Rake::Task['test'].comment = "Unit"

