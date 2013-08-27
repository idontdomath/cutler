module Cutler
	extend self

	def mode
		return @mode if @mode
		self.mode = :cloudflare
	end

	def mode=(mode)
		case mode
		when Symbol, String
			require File.dirname(__FILE__) + "/mode/#{mode}"
			@mode = Cutler::Mode.const_get("#{mode.to_s.capitalize}")
		else
			raise "Missing mode #{adapter_name}"  
		end
	end

	def options
		return @options if @options
		{}
	end

	def options=(options)
		@options = options
	end

	def clean(url)
		@mode.options = @options
		@mode.clean(url)
	end

end
