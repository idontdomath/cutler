module Cutler
	extend self

	def mode
		return @mode if @mode
		self.mode = :cloudflare
	end

	def mode=(mode)
		case mode
		when Symbol, String
			begin
				require File.dirname(__FILE__) + "/mode/#{mode}"
				@mode = Cutler::Mode.const_get("#{mode.to_s.capitalize}")		
			rescue Exception => e
				raise "Missing mode #{mode}"				
			end
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
