require "net/https"
require "uri"
require "json"


module Cutler
	module Mode
		module Cloudflare
			extend self

			def setup
				@service_uri = URI.parse("https://www.cloudflare.com/api_json.html")
			end

			def options=(options)
				@options = options
			end

			def build_purge_request(url)
				request = Net::HTTP::Post.new(@service_uri.request_uri)

				uri_to_purge = URI.parse(url)

				specific_options = {}
				#the target domain
				specific_options[:z] = uri_to_purge.host
				#full url to be purged 
				specific_options[:url] = url
				#action to perform against the api
				specific_options[:a] = 'zone_file_purge'
				
				request.set_form_data(specific_options.merge(@options))
				
				return request
			end

			def clean(url)

				setup

				http = Net::HTTP.new(@service_uri.host, @service_uri.port)
				http.use_ssl = true
				http.verify_mode = OpenSSL::SSL::VERIFY_NONE
				
				response = http.request(build_purge_request(url))

				result = JSON.parse(response.body)
				
				result['result'] == 'success' if response.is_a?(Net::HTTPSuccess)

			end
		end
	end
end
