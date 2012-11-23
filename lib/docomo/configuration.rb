require 'singleton'

module Docomo
  class Configuration
    include Singleton

    cattr_accessor :root
    @@root = Docomo::Engine.root # will default to Rails.root

    cattr_accessor :title
    @@title = "Docomo Documentation"

    cattr_accessor :template_filename
    @@template_filename = "app/views/layouts/docomo.html.haml"

    cattr_accessor :output_path
    @@output_path = "public/docomo"

    cattr_accessor :manifest_matcher
    @@manifest_matcher = ["app/assets/**/*.md", "lib/assets/**/*.md"]

    cattr_accessor :use_pygments
    @@use_pygments = false

    cattr_accessor :markdown_options
    @@markdown_options = {
      autolink: true,
      no_intra_emphasis: true,
      tables: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true,
      space_after_headers: true
    }
  end

  mattr_accessor :configuration
  @@configuration = Configuration

  def self.setup
    yield @@configuration
  end
end
