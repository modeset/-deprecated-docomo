class Docomo::Processor
  include Docomo::Helpers

  def initialize(config = nil)
    @config = config || Docomo.configuration
  end

  def render_to_string
    haml_to_html(template)
  end
  alias_method :render, :render_to_string

  def render_to_file(output_path = nil)
    path = @config.root.join(output_path || @config.output_path)
    FileUtils.mkdir_p(path)
    File.open(path.join('index.html'), "w") { |file| file.write(render_to_string) }
  end

  protected

  def title
    @config.title
  end

  def aside_items
    manifest.map do |file|
      id = File.dirname(File.expand_path(file)).split("/").last
      {id: id, title: id.gsub(/_|-/, " ").titleize}
    end
  end

  def content_sections
    manifest.map do |file|
      id = File.dirname(File.expand_path(file)).split("/").last
      {id: id, content: Docomo::Parser.new(file, @config).parse}
    end
  end

  private

  def manifest
    @memoized_manifest ||= Dir.glob(@config.manifest_matcher.map { |path| @config.root.join(path) })
  end

  def template
    File.read(locate_file(@config.template_filename, @config.root))
  end
end
