require 'rubygems'
require 'test/unit'

require File.dirname(__FILE__) + "/../lib/cutler"

class ModeTest < Test::Unit::TestCase

	def test_cloudflare_mode
		assert Cutler.mode = :cloudflare
	end

	def test_varnish_mode
		assert Cutler.mode = :varnish
	end

	def test_akamai_mode
		begin
			assert Cutler.mode = :akamai
			fail		
		rescue Exception => e
			assert true
		end
	end

end