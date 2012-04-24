module SnaplogicRackspace

  class SnaplogicServers

    #@@cs = CloudServers::Connection.new(:username => USERNAME, :api_key => API_KEY)

    def initialize(options)
      username = options.username
      api_key = options.apikey
      @cs = CloudServers::Connection.new(:username => username, :api_key => api_key)
    end

    def self.connect(options)
      username = options.username
      api_key = options.apikey
      @@cs = CloudServers::Connection.new(:username => username, :api_key => api_key)
    end

    # Create rackspace servers
    def create_servers(options, flavor_number=1, image_id=1, first=1, last=20)
      names = []
      flavor_number = options.flavor_number
      image_id = options.image_id
      first = options.start_number
      last = options.start_number + options.create
      #cs = CloudServers::Connection.new(:username => USERNAME, :api_key => API_KEY)
      sleep(2)
      # Open file for writing ids
      f = File.open(options.file,"w")
      # Bring up a range of slaves
      (first..last).each do |number|
	 slavename = "slave" + String(number) + ".qa.company.com"
	 puts slavename
	 #flavor = cs.get_flavor(Integer(flavor_number))
	 flavor = Integer(flavor_number)
	 image = Integer(image_id)
	 newserver = @cs.create_server(:name => slavename, :imageId => image, :flavorId => flavor)
	 # Get the public IP of the server
	 names[Integer(number)] = slavename
	 f.puts(newserver.id)
	 puts(newserver.id)
	 sleep(10)
       end
       # Close file
       f.close
    end

    # Delete all servers created
    def delete_servers(options)
      puts "Deleting Servers"
      #cs = CloudServers::Connection.new(:username => USERNAME, :api_key => API_KEY)
      f = File.open(options.file,'r')
      f.each_line do |line|
	 id = Integer(line)
	 server = @cs.get_server(id)
	 server.delete!
	 sleep(5)
	 puts id
      end
      f.close
    end

    # Create a single server based using an image_id
    def self.create_server(options)
      puts "Creating a single server"
      name = options.name
      image = options.image
      flavor = options.flavor
      self.connect(options)
      newserver = @@cs.create_server(:name => name, :imageId => image, :flavorId => flavor)
      newserver
    end

    # Delete a single server based on server_id
    def self.delete_server(options)
      puts "Deleting a single server"
      id = options.image_id
      self.connect(options)
      server = @@cs.get_server(id)
      server.delete!
    end

    # List rackspace servers
    def self.list_servers(options)
      self.connect(options)
      sleep(2)
      pp @@cs.list_servers
    end

  end # End of SnapLogicServers

end # end of module marker
