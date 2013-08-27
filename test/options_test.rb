require 'rubygems'
require 'test/unit'
require 'fakeweb'

require File.dirname(__FILE__) + "/../lib/cutler"

class OptionsTest < Test::Unit::TestCase

	def test_default_options
		Cutler.options = nil
		assert Cutler.options == {}
	end

	def test_set_options
		Cutler.options = {:a => 1, :b => 2}
		assert Cutler.options[:a] == 1
		assert Cutler.options[:b] == 2
	end
end
