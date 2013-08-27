require 'rubygems'
require 'test/unit'
require 'fakeweb'

require File.dirname(__FILE__) + "/../lib/cutler"

class VarnishTest < Test::Unit::TestCase

	def setup
		
		#we consider the following cases
		#https://www.varnish-cache.org/docs/3.0/tutorial/purging.html

		@existing_url = 'http://authorized-varnish-server/some/path'
		@non_existing_url = 'http://authorized-varnish-server/non/existing/path'
		@not_allowed_url = 'http://not-allowed-varnish-server/some/path'

		FakeWeb.allow_net_connect = false
		FakeWeb.register_uri(:purge, @existing_url, :body => "Purged.")
		FakeWeb.register_uri(:purge, @non_existing_url, :body => "Not Found.", :status => ["404", "Not Found"])
		FakeWeb.register_uri(:purge, @not_allowed_url, :body => "Not Allowed", :status => ["405", "Not Allowed"])

	end

	def test_varnish_purge
		Cutler.mode = :varnish
		assert Cutler.clean @existing_url
	end

	def test_varnish_not_found
		Cutler.mode = :varnish
		assert !(Cutler.clean @non_existing_url)
	end
	
	def test_varnish_not_allowed
		Cutler.mode = :varnish
		assert !(Cutler.clean @not_allowed_url)
	end

end
