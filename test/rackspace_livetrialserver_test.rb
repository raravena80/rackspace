require 'test/unit'
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rackspace'
require 'rubygems'

class TestLiveTrialServer < Test::Unit::TestCase

   def test_parseArguments
     # This is only for testing
     parameters = ["-u","company","-a","1b3df0d1554fe78aca42f144db0bde6c",
                   "-C","ACME","-E","raravena80@yahoo.com",
                   "-i","12717555"]
     options = Rackspace::ParseArguments.parse(parameters)
     assert_equal(options.apikey, "1b3df0d1554fe78aca42f144db0bde6c")
     assert_equal(options.file, "serverids")
     assert_equal(options.username, "company")
     assert_equal(options.customername, "ACME")
     assert_equal(options.customeremail, "raravena80@yahoo.com")
     assert_equal(options.flavor_number, 1)
     assert_equal(options.create, 0)
     assert_equal(options.encoding, "utf8")
     assert_equal(options.image_id, "12717555")
     assert_equal(options.verbose, false)
     assert_equal(options.start_number, 1)
   end


   def test_liveTrialServer
     # This is only for testing
     parameters = ["-u","company","-a","1b3df0d1554fe78aca42f144db0bde6c",
                   "-C","ricardo5","-E","raravena80@yahoo.com",
                   "-i","12717555"]
     options = Rackspace::ParseArguments.parse(parameters)
     livetrial = Rackspace::LiveTrialServer.new(options)
     livetrial.create(options)
     #livetrial.delete(options)
   end


end

