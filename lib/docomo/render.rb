require 'redcarpet'
require 'pygments'

class Docomo::Render < Redcarpet::Render::HTML
  include Docomo::Helpers

  def self.render(content, filename = nil, config = nil)
    config ||= Docomo.configuration
    @markdown = Redcarpet::Markdown.new(self.new({}, filename, config), config.markdown_options)
    @markdown.render(content)
  end

  def initialize(extensions = {}, filename = '', config = nil)
    @root = File.dirname(filename)
    @config = config
    super(extensions)
  end

  def autolink(link, link_type)
    link(link, '', link)
  end

  def link(link, title, alt_text)
    if !!(alt_text =~ %r(^&lt;))
      import_file(link, !!(alt_text =~ %r(^&lt;~)))
    else
      target = !(link =~ %r(^https?://)) ? '' : ' target="_blank"'
      %Q(<a#{target} href="#{link}" title="#{title}">#{alt_text}</a>)
    end
  end

  def block_code(code, language)
    if !!(language =~ %r(^~))
      usage_block(code, language.gsub('~', ''))
    else
      if @config.use_pygments
        Pygments.highlight(code, lexer: language)
      else
        %Q(<pre><code class="#{language}">#{code}</code></pre>)
      end
    end
  end

  def import_file(filename, usage = false)
    filename = File.expand_path(filename, @root)
    content = File.read(filename).strip + "\n"
    usage ? usage_block(content, File.extname(filename).gsub('.', '')) : content
  end

  def usage_block(content, language)
    case language
      when 'haml'
        result = haml_to_html(content)
      else
        result = self.class.render(content, filename, @config)
    end
    result + block_code(content, language).html_safe
  end
end
