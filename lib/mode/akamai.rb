require "akamai_api"

module Cutler
	module Mode
		module Akamai
			extend self

			def setup
				@purge_method = 'invalidate' # or remove
				AkamaiApi.config.merge! :auth => [ @options["email"], @options["password"]]
				puts @options
			end

			def options=(options)
				@options = options
			end

			def build_purge_request
			end

			def clean(url)
				setup
				response = AkamaiApi::Ccu.purge @purge_method.to_s, :arl, url
				return response.is_a?(Net::HTTPSuccess)

			end
		end
	end
end

