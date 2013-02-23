require 'rails'

require File.dirname(__FILE__) + '/../../../app/helpers/flash_block_helper.rb'
require File.dirname(__FILE__) + '/../../../app/helpers/glyph_helper.rb'
require File.dirname(__FILE__) + '/../../../app/helpers/social_glyph_helper.rb'

module Groundworkcss
	module Rails
		class Engine < ::Rails::Engine
			initializer 'groundworkcss-rails.setup',
				:after => 'less-rails.after.load_config_initializers',
				:group => :all do |app|
					if defined?(Less)
						app.config.less.paths << File.join(config.root, 'vendor', 'toolkit')
					end
				end

			initializer 'groundworkcss-rails.setup_helpers' do |app|
				app.config.to_prepare do
					ActionController::Base.send :helper, FlashBlockHelper
					ActionController::Base.send :helper, GlyphHelper
					ActionController::Base.send :helper, SocialGlyphHelper
				end
			end
		end
	end
end
