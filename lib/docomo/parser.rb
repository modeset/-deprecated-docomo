class Docomo::Parser
  include Docomo::Helpers

  def initialize(filename, config)
    @config = config
    @file = File.expand_path(filename)
    @content = File.read(@file)
  end

  def parse
    Docomo::Render.render(@content, @file, @config)
  end

end
