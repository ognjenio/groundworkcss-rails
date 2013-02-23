require 'rails/generators'

module Groundworkcss
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator installs GroundworkCSS to Asset Pipeline"
      argument :stylesheets_type, :type => :string, :default => 'less', :banner => '*less or static'

      def add_assets

        if File.exist?('app/assets/javascripts/application.js')
          insert_into_file "app/assets/javascripts/application.js", "//= require groundwork\n", :after => "jquery_ujs\n"
        else
          copy_file "application.js", "app/assets/javascripts/application.js"
        end

        if File.exist?('app/assets/stylesheets/application.css')
					style_require_block = "\n@import \"groundwork-and-overrides\";\n"
					insert_into_file "app/assets/stylesheets/application.css", style_require_block, :after => " */\n"
					File.rename("app/assets/stylesheets/application.css", "app/assets/stylesheets/application.css.scss")
					
				elsif File.exist?("app/assets/stylesheets/application.css.scss")
					style_require_block = "\n@import \"groundwork-and-overrides\";\n"
					insert_into_file "app/assets/stylesheets/application.css.scss", style_require_block, :after => " */\n"
					
        else
          copy_file "application.css.scss", "app/assets/stylesheets/application.css.scss"
        end
        
        copy_file "groundwork-and-overrides.scss", "app/assets/stylesheets/groundwork-and-overrides.scss" 

      end

      def add_javascript 	
        if use_coffeescript?
          copy_file "groundwork.coffee", "app/assets/javascripts/groundwork.js.coffee"
        else
          copy_file "groundwork.js", "app/assets/javascripts/groundwork.js"
        end
      end
      
		private
      def use_coffeescript?
        ::Rails.configuration.app_generators.rails[:javascript_engine] == :coffee
      end
    end
  end
end
