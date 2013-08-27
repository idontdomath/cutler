require 'net/http'
require "uri"
require "json"

module Net
  class HTTP::Purge < HTTPRequest
        METHOD='PURGE'
        REQUEST_HAS_BODY = false
        RESPONSE_HAS_BODY = true
  end
end

module Cutler
	module Mode
		module Varnish
			extend self

			def setup
				
			end

			def options=(options)
				@options = options
			end

			def build_purge_request(url)
				request = Net::HTTP::Purge.new(@service_uri.request_uri)				
				return request
			end

			def clean(url)

				@service_uri = URI.parse(url)

				http = Net::HTTP.new(@service_uri.host, @service_uri.port)		
				response = http.request(build_purge_request(url))
				
				return response.is_a?(Net::HTTPSuccess)

			end
		end
	end
end
