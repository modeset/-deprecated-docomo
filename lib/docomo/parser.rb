class Docomo::Parser
  include Docomo::Helpers

  NONE = 0
  COLLECTING = 1

  def initialize(filename, config)
    @config = config
    @root_file = File.expand_path(filename)
    @file_handle = open_file
    @state = NONE
    @content = ''
  end

  def parse
    @file_handle.each { |line| parse_line(line) }
    markdown_to_html(@content)
  end

  private

  def parse_line(line)
    case @state

    when NONE
      # usage examples
      if identifier(line, /^<!--~?\s+|^`{3}/)
        @usage_example = identifier(line, /^<!--~\s+|^`{3}~(haml|html)/) ? true : false
        # import file
        if identifier(line, /^<!--~?\s+/)
          @collected, @collected_format = import_file(line)
          append_collected
        # begin collection
        else
          begin_collecting(line)
        end
      # just append the line like normal
      else
        append(line)
      end

    when COLLECTING
      # end the example usage collection
      if identifier(line, /^`{3}/)
        append_collected
        @state = NONE
      # collect usage example
      else
        @collected << line
      end
    end
  end

  def import_file(line)
    return unless matches = line.match(/^<\!--~\s+([\w|\/|\.\s]+)\s+-->/)
    filename = matches[1]
    format = File.extname(filename).gsub('.', '')
    content = File.read(File.expand_path(filename, File.dirname(@root_file))).strip + "\n"
    [content, format]
  end

  def begin_collecting(line)
    @collected = ''
    @state = COLLECTING
    @collected_format = line.match(/^`{3}~?(\w+)/)[1]
  end

  def append_collected
    return unless @collected.present?
    format = @collected_format
    format = 'coffeescript' if format == 'coffee'
    append_usage_example(@collected, format) if @usage_example
    append("\n```#{format}\n#{@collected}```\n")
  end

  def append_usage_example(content, format)
    append('<div class="docomo-showcase">')
    append(format == 'haml' ? haml_to_html(content) : content)
    append("</div>")
  end

  def append(content = '')
    @content << content
  end

  def identifier(line, regexp)
    !!(line =~ regexp)
  end

  def open_file
    File.new(@root_file, "r")
  end
end
