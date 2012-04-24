require 'test/unit'
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rackspace'
require 'rubygems'

class TestListImages < Test::Unit::TestCase


   def test_parseArguments
     parameters = ["-u","company","-a","1b3df0d1554fe78aca42f144db0bde6c"]
     options = SnaplogicRackspace::ParseArguments.parse(parameters)
     assert_equal(options.apikey, "1b3df0d1554fe78aca42f144db0bde6c")
     assert_equal(options.file, "serverids")
     assert_equal(options.username, "company")
     assert_equal(options.flavor_number, 1)
     assert_equal(options.create, 0)
     assert_equal(options.encoding, "utf8")
     #assert_equal(options.image_id, 11358927)
     assert_equal(options.verbose, false)
     assert_equal(options.start_number, 1)
   end


   def test_listServers
     parameters = ["-u","company","-a","1b3df0d1554fe78aca42f144db0bde6c"]
     options = Rackspace::ParseArguments.parse(parameters)
     Rackspace::SnaplogicServers.list_servers(options)
   end


end

