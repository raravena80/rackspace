require 'test/unit'
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rackspace'
require 'rubygems'

class TestLiveTrialServer < Test::Unit::TestCase

   def test_parseArguments
     # These parameters are only for testing
     parameters = ["-u","company","-a","1b3df0d1554fe78aca42f144db0bde6c",
                   "-C","ACME","-E","raravena809@yahoo.com",
                   "-i","13038769"]
     options = Rackspace::ParseArguments.parse(parameters)
     assert_equal(options.apikey, "1b3df0d1554fe78aca42f144db0bde6c")
     assert_equal(options.file, "serverids")
     assert_equal(options.username, "company")
     assert_equal(options.customername, "ricardo3")
     assert_equal(options.customeremail, "raravena80@yahoo.com")
     assert_equal(options.flavor_number, 1)
     assert_equal(options.create, 0)
     assert_equal(options.encoding, "utf8")
     assert_equal(options.image_id, "13038769")
     assert_equal(options.verbose, false)
     assert_equal(options.start_number, 1)
   end

   def test_createServers
     # These parameters are only for testing
     parameters = ["-u","company","-a","1b3df0d1554fe78aca42f144db0bde6c",
                   "-i","13038769","-n","slave","-c","5"]
     options = SnaplogicRackspace::ParseArguments.parse(parameters)
     slsevers = SnaplogicRackspace::SnaplogicServers.new(options)
     slservers.create(options)
   end

   def test_deleteServers
     # These parameters are only for testing
     parameters = ["-u","company","-a","1b3df0d1554fe78aca42f144db0bde6c",
                   "-d","serverids"]
     options = Rackspace::ParseArguments.parse(parameters)
     slsevers = Rackspace::SnaplogicServers.new(options)
     slservers.delete(options)
   end
end

