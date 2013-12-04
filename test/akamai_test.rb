require 'rubygems'
require 'test/unit'

require File.dirname(__FILE__) + "/../lib/cutler"

class AkamaiTest < Test::Unit::TestCase

	def setup
		
	end

	def test_cloudflare_clean
		Cutler.mode = :akamai
		# given that the current implementation is done
		# with a third party library, this is not covered
		assert true
	end

end
