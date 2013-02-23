module Groundworkcss
	module Rails
		require 'groundworkcss/rails/engine' if defined?(Rails)
	end
end

#require 'less-rails'
require 'groundworkcss/rails/groundworkcss' if defined?(Rails)
