require 'haml'

module Docomo::Helpers

  private

  def locate_file(filename, root = nil)
    for file in [(root || Rails.root).join(filename), Docomo::Engine.root.join(filename)]
      return file if File.exists?(file)
    end
    raise "DocomoFileNotFound"
  end

  def markdown_to_html(markdown = '')
    @markdown ||= Redcarpet::Markdown.new(Docomo::Render.new({}, @config || Docomo.configuration), (@config || Docomo.configuration).markdown_options)
    @markdown.render(markdown)
  end

  def haml_to_html(haml)
    Haml::Engine.new(haml).render(binding)
  end

end
