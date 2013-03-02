require 'rails/generators'

module Groundworkcss
  module Generators
    class LayoutGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator generates layout file with navigation."
      argument :layout_name, :type => :string, :default => "application"
      attr_reader :app_name, :container_class

      def generate_layout
        app = ::Rails.application
        @app_name = app.class.to_s.split("::").first
        ext = :erb
        template "layout.html.#{ext}", "app/views/layouts/#{layout_name}.html.#{ext}"
        copy_file "_sidebar.html.#{ext}", "app/views/layouts/_sidebar.html.#{ext}"
        copy_file "_header.html.#{ext}", "app/views/layouts/_header.html.#{ext}"        
      end
    end
  end
end
