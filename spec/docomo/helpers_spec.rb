require 'spec_helper'

describe Docomo::Helpers do

  subject {
    Class.new do
      include Docomo::Helpers
      @config = OpenStruct.new(
        title: "Test Title",
        template_filename: "fixtures/template.html.haml",
        use_pygments: true,
        markdown_options: {
          autolink: true,
          no_intra_emphasis: true,
          tables: true,
          fenced_code_blocks: true,
          lax_html_blocks: true,
          strikethrough: true,
          superscript: true,
          space_after_headers: true
        }
      )
    end
  }

  describe "#locate_file" do

    it "looks in rails root, and then the engine root as a fallback" do
      result = subject.new.send(:locate_file, 'config/initializers/docomo.rb')
      expect(result).to be_a(Pathname)
      expect(result.to_s).to match(%r(spec/dummy/config/initializers/docomo.rb))

      result = subject.new.send(:locate_file, 'app/controllers/docomo/live_controller.rb')
      expect(result.to_s).to match(%r(app/controllers/docomo/live_controller.rb))
      expect(result.to_s).to_not match(%r(spec/dummy/app/controllers/docomo/live_controller.rb))
    end

    it "raises an exception when the file isn't found" do
      expect{ subject.new.send(:locate_file, 'bad_file_name') }.to raise_error("DocomoFileNotFound")
    end

  end

  describe "#haml_to_html" do

    it "renders haml to html" do
      result = subject.new.send(:haml_to_html, '%h1 title')
      expect(result).to eql("<h1>title</h1>\n")
    end

  end

end
