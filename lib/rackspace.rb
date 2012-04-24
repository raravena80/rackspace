## #!/usr/bin/env ruby
# 
# == Cloud Servers API
# ==== Library that interfaces with Rackspace Cloud Servers and Files 
# By Ricardo Aravena <raravena80@yahoo.com>
#
# GNU GPLv3 license
# 
# === Documentation & Examples
# To begin reviewing the available methods and examples, peruse the README.rodc file, or begin by looking at documentation for the 
# CloudServers::Connection class.
#
# The Rackspace class is the base class.  Not much of note aside from housekeeping happens here.

module Rackspace

  USERNAME = "rackspaceuser"
  API_KEY = "1b3df0d1554fe78aca42f144db0bde6c"

  require "rubygems"
  require "cloudservers"
  require 'ostruct'
  require "optparse"
  require 'optparse/time'
  require 'pp'


  $:.unshift(File.dirname(__FILE__))
  require "rackspace/base.rb"
  require "rackspace/parsearguments.rb"
  require "rackspace/servers.rb"
  require "rackspace/images.rb"
  require "rackspace/livetrialserver.rb"

end

