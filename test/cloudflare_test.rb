require 'rubygems'
require 'test/unit'
require 'fakeweb'

require File.dirname(__FILE__) + "/../lib/cutler"

class CloudflareTest < Test::Unit::TestCase

	def setup
		
		FakeWeb.allow_net_connect = false
		FakeWeb.register_uri(:post, "https://www.cloudflare.com:443/api_json.html", 
							 :body => '{"result":"success"}')
	end

	def test_cloudflare_clean
		Cutler.mode = :cloudflare

		options = {}
		options['tkn'] = '8afbe6dea02407989af4dd4c97bb6e25'
		options['email'] = 'sample@example.com'
		Cutler.options = options

		assert Cutler.clean 'http://www.example.com'
	end

end
