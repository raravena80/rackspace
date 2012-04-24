module SnaplogicRackspace
  class Base

    def initialize(username, api_key)
        @new_username = username || @new_username = USERNAME
        @new_api_key = api-key || @new_api_key = API_KEY
    end

    def newservers_from_image(image, number)
	@new_image = image || (raise Exception::Authentication, "Must supply an image name :image")
	@new_number = number || (raise Exception::Authentication, "Must supply a number of servers to be created :number")
    end 

  end

end

