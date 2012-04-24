module SnaplogicRackspace

  class SnaplogicImages

    def initialize(options)
      @@cs = CloudServers::Connection.new(:username => USERNAME, :api_key => API_KEY)
    end

    def self.connect(options)
      @@cs = CloudServers::Connection.new(:username => USERNAME, :api_key => API_KEY)
    end

    # Create rackspace servers
    def self.list_images(options)
      self.connect(options)
      sleep(2)
      pp @@cs.list_images
    end

    # Delete all servers created
    def self.delete_image(imageid)
      puts "Deleting image"
      self.connect(options)
      image = @@cs.get_image(imageid)
      image.delete!
      sleep(5)
    end

  end # End of SnapLogicServers

end # end of module marker
