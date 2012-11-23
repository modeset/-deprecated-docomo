require 'spec_helper'

describe Docomo::Parser do

  subject { Docomo::Parser }

  let(:config) {
    OpenStruct.new(
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
  }

  describe "parsing" do

    it "gives me the expected output" do
      filename, expected = assertion_criteria_for('readme_button_semigloss')
      result = subject.new(filename, config).parse
      expect(result).to eql(expected)
    end

  end

  def assertion_criteria_for(source)
    filename = Docomo::Engine.root.join("spec/fixtures/sources/#{source}.md")
    expected = File.read(Docomo::Engine.root.join("spec/fixtures/results/#{source}.html"))
    [filename, expected]
  end

end
