module Docomo
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root Docomo::Engine.root

      desc "Installs the Docomo initializer and optionally, the template and asset files, into your application."

      class_option :full, :type => :boolean, :aliases => '-g',
                   :desc => 'Full installation will install the template and asset files for easier customization.'

      def copy_initializer
        copy_file 'config/initializers/docomo.rb'
      end

      def copy_template_and_assets
        if options[:full] || yes?("Install the template and asset files for easier customization? [yN]")
          copy_file 'app/views/layouts/docomo.html.haml'
          copy_file 'app/assets/stylesheets/docomo.css'
          copy_file 'app/assets/javascripts/docomo.js'
        end
      end

      def display_readme
        readme 'lib/generators/docomo/install/POST_INSTALL' if behavior == :invoke
      end
    end
  end
end
