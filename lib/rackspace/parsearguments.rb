module Rackspace

  class ParseArguments

      attr_accessor   :options

      CODES = %w[iso-2022-jp shift_jis euc-jp utf8 binary]
      CODE_ALIASES = { "jis" => "iso-2022-jp", "sjis" => "shift_jis" }

      def initialize(args)
          @new_args = args
      end

      #
      # Return a structure describing the options.
      #
      def self.parse(args)
	# The options specified on the command line will be collected in *options*.
	# We set default values here.
	options = OpenStruct.new
	options.apikey = "1b3df0d1554fe78aca42f144db0bde6c"
	options.username = "snapeng"
	options.encoding = "utf8"
	options.verbose = false
	options.create = 0
	options.file = "serverids"
	options.flavor_number = 1
	options.image_id = 12961468
	options.start_number = 1
        options.customername = "company"
        options.customeremail = "ops@company.com"

	opts = OptionParser.new do |opts|
	  opts.banner = "Usage: rackspace.rb [options]"

	  opts.separator ""
	  opts.separator "Specific options:"

	  # Required argument create
	  opts.on("-c", "--create NUMBER", Integer,
		  "Number of Servers to create") do |create|
	    options.create = create
	  end

	  # Required argument file, id output file
	  opts.on("-f", "--file FILENAME",
		  "Filename containing Instance ids to delete") do |file|
	    options.file = file
	  end

	  # Required argument delete and the file with ids to delete
	  opts.on("-d", "--delete FILENAME",
		  "Delete instances with ids in filename") do |delete|
	    options.delete = delete
	  end

	  # Required argument name, prefix for server names
	  opts.on("-n", "--name NAME", 
		  "Number of Servers to create") do |name|
	    options.name = name
	  end

	  # Optional argument defaults to API Key
	  opts.on("-a", "--apikey [API-KEY]",
		  "Rackspace API Key") do |apikey|
	    options.apikey = apikey
	  end

          # Optional argument defaults to Flavor number 1 (256MB)
          opts.on("-F", "--flavor [FLAVOR-NUMBER]",
                  "Rackspace Flavor Number") do |flavor_number|
            options.flavor_number = flavor_number
          end

          # Optional argument for livetrial defaults to customer name
          opts.on("-C", "--customername [CUSTOMERNAME]",
                  "Rackspace Livetrial Customer Name") do |customername|
            options.customername = customername
          end

          # Optional argument for livetrial defaults to customer name
          opts.on("-E", "--customeremail [CUSTOMEREMAIL]",
                  "Rackspace Livetrial Customer Email") do |customeremail|
            options.customeremail = customeremail
          end

	  # Optional argument defaults to "snapeng"
	  opts.on("-u", "--username [USERNAME]",
		  "Username for the Rackspace Acccount") do |username|
	    options.username = username
	  end

	  # Required argument
	  opts.on("-i", "--imageid IMAGEID",
		  "Image Id to use when creating server") do |image_id|
	    options.image_id = image_id
	  end

	  # Required argument
	  opts.on("-s", "--imageid IMAGEID",
		  "Sequence number from where to start building servers") do |start_number|
	    options.start_number = start_number
	  end

	  # Boolean switch.
	  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
	    options.verbose = v
	  end

	  opts.separator ""
	  opts.separator "Common options:"

	  # No argument, shows at tail.  This will print an options summary.
	  # Try it and see!
	  opts.on_tail("-h", "--help", "Show this message") do
	    puts opts
	    exit
	  end

	end

	begin
	  opts.parse!(args)
	# Handle the case of an Invalid Option
	rescue OptionParser::InvalidOption => e
	  puts e
	  puts opts
	  exit 1
	# Handle the case of an Invalid Argument
	rescue OptionParser::InvalidArgument => e
	  puts e
	  puts opts
	  exit 1
	# Handle the case of an Missing Argument
	rescue OptionParser::MissingArgument => e
	  puts e
	  puts opts
	  exit 1
	end
	options
      end  # parse()
  end # ParseArguments
end # Module statement

