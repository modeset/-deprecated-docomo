require 'redcarpet'

class Docomo::Render < Redcarpet::Render::HTML
  def link(link, title, alt_text)
    target = !(link =~ %r(^https?://)) ? '' : ' target="_blank"'
    %Q(<a#{target} href="#{link}" title="#{title}">#{alt_text}</a>)
  end

  def autolink(link, link_type)
    link(link, '', link)
  end
end
