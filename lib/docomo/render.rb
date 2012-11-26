require 'redcarpet'
require 'pygments'

class Docomo::Render < Redcarpet::Render::HTML
  def initialize(extensions = {}, config = nil)
    @config = config || Docomo.configuration
    super(extensions)
  end

  def link(link, title, alt_text)
    target = !(link =~ %r(^https?://)) ? '' : ' target="_blank"'
    %Q(<a#{target} href="#{link}" title="#{title}">#{alt_text}</a>)
  end

  def autolink(link, link_type)
    link(link, '', link)
  end

  def block_code(code, language)
    if @config.use_pygments
      Pygments.highlight(code, lexer: language.gsub('~', ''))
    else
      %Q(<pre><code class="#{language}">#{code}</code></pre>)
    end
  end
end
