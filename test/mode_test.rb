require 'rubygems'
require 'test/unit'

require File.dirname(__FILE__) + "/../lib/cutler"

class ModeTest < Test::Unit::TestCase

	def test_cloudflare_mode
		assert (Cutler.mode = :cloudflare) != nil
	end

	def test_varnish_mode
		assert (Cutler.mode = :varnish) != nil
	end

	def test_akamai_mode
		assert (Cutler.mode = :akamai) != nil
	end

	def test_cloudfront_mode
		assert_raise( RuntimeError ) { Cutler.mode = :cloudfront }
	end

	def test_any_mode
		assert_raise( RuntimeError ) { Cutler.mode = :any }
	end


end