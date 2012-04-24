module SnaplogicRackspace

  # This class initializes a live trial instance in rackspace 
  # This class required that a mysql server be installed on the host machine
  # The mysql must have a database with the name livetrial
  # The mysql server must have a username 'livetrial' and password 'livetrial123!
  # with all privileges
  class LiveTrialServer

    require "mysql"

    attr_reader :newserver

    def initialize(options)
      @USERNAME = options.username
      @API_KEY = options.apikey
      @cs = CloudServers::Connection.new(:username => @USERNAME, :api_key => @API_KEY)
    end

    # Create live trial servers
    def createlive(options)
      customername = options.customername
      customeremail = options.customeremail
      flavor_number = options.flavor_number
      #username = customeremail[/[^@]+/]
      uniquename = customeremail.sub("@","-")
      uniquename = uniquename.sub(".","-")
      image_id = options.image_id
      sleep(2)
      name = uniquename + ".dyn.company.com"
      flavor = Integer(flavor_number)
      image = Integer(image_id)
      # Create new server
      @newserver = @cs.create_server(:name => name, :imageId => image, :flavorId => flavor)
      sleep(10)
    end

    # Delete live trial server
    def deletelive(serverid)
      puts "Deleting Live Trial Server"
      server = @cs.get_server(serverid)
      # Update Dynamic DNS to delete server
      nsupdatecmd = "bash -c \"nsupdate -y dyn.:BxrCTGujlqG1n2vUJ8Ew7g== <<EOF
                     server adm1.dyn.company.com
                     zone dyn.company.com
                     update delete #{server.name}. 300 A #{server.addresses[:public].first}
                     send\nEOF\"\n"
      system(nsupdatecmd)
      # Delete the server from rackspace
      server.delete!
      sleep(5)
    end

    # Create live trial servers with mysql database
    def createlivewdatabase(options)
      customername = options.customername
      customeremail = options.customeremail
      flavor_number = options.flavor_number
      #username = customeremail[/[^@]+/]
      uniquename = customeremail.sub("@","-")
      uniquename = uniquename.sub(".","-")
      image_id = options.image_id
      sleep(2)
      name = uniquename + ".dyn.company.com"
      flavor = Integer(flavor_number)
      image = Integer(image_id)
      # Create new server
      @newserver = @cs.create_server(:name => name, :imageId => image, :flavorId => flavor)
      sleep(10)
      query = "CREATE TABLE IF NOT EXISTS livetrial ( \
                  rackspaceid INT, \
                  name VARCHAR(200), \
                  customername VARCHAR(200), \
                  customeremail VARCHAR(200) \
               );"
      dbh = dbconnect
      dbh.query(query)
      query = "INSERT INTO livetrial (rackspaceid, name, customername, customeremail) VALUES \
              (#{@newserver.id}, \"#{@newserver.name}\", \"#{customername}\", \"#{customeremail}\")"
      # Insert live trial instance into SQL database
      dbh.query(query)
      dbdisconnect(dbh)
    end

    # Delete live trial server with mysql database
    def deletelivewdatabase(options)
      puts "Deleting Live Trial Server"
      customeremail = options.customeremail
      dbh = dbconnect
      query = "SELECT rackspaceid, name, customername, customeremail FROM livetrial \
               WHERE customeremail=\"#{customeremail}\""
      result = dbh.query(query)
      row = result.fetch_hash
      id = Integer(row['rackspaceid'])
      server = @cs.get_server(id)
      # Update Dynamic DNS to delete server
      nsupdatecmd = "bash -c \"nsupdate -y dyn.:BxrCTGujlqG1n2vUJ8Ew7g== <<EOF
                     server adm1.dyn.company.com
                     zone dyn.company.com
                     update delete #{server.name}. 300 A #{server.addresses[:public].first}
                     send\nEOF\"\n"
      system(nsupdatecmd)
      # Delete the server from rackspace
      server.delete!
      sleep(5)
      result.free 
      query = "DELETE FROM livetrial WHERE rackspaceid=#{id}"
      dbh.query(query)
      dbdisconnect(dbh)
    end

    # Connect to Mysql database where we store livetrial info
    def dbconnect
      begin
         dbh = Mysql.new("localhost", "livetrial", "livetrial123!", "livetrial")
      rescue Mysql::Error => e
         puts "Error code: #{e.errno}"
         puts "Error message: #{e.error}"
         puts "Error SQLSTATE: #{e.sqlstate}" if e.respond_to?("sqlstate")
       end
       dbh
    end

    # disconnect from Mysql server
    def dbdisconnect(dbh)
       dbh.close if dbh
    end

  end # End of Servers

end # end of module marker

