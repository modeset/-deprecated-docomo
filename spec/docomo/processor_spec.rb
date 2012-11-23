require 'spec_helper'

describe Docomo::Processor do

  subject { Docomo::Processor }

  let(:config) {
    OpenStruct.new(
      root: Docomo::Engine.root.join('spec'),
      title: "Test Title",
      template_filename: "fixtures/template.html.haml",
      output_path: "tmp/output",
      manifest_matcher: ["fixtures/sources/*.md"],
    )
  }

  describe "#render_to_string" do

    it "renders" do
      subject.any_instance.should_receive(:template).and_return('%h1 title')
      result = subject.new(config).render_to_string
      expect(result).to eql("<h1>title</h1>\n")
    end

  end

  describe "#render_to_file" do

    it "renders and writes to a file" do
      subject.any_instance.should_receive(:render_to_string).and_return("<h1>title</h1>\n")
      FileUtils.should_receive(:mkdir_p)
      File.should_receive(:open).and_yield(file = mock('file'))
      file.should_receive(:write).with("<h1>title</h1>\n")
      subject.new(config).render_to_file
    end

  end

  describe "#title" do

    it "returns the title" do
      result = subject.new(config).send(:title)
      expect(result).to eql("Test Title")
    end

  end

  describe "#aside_items" do

    it "returns a collection of hashes with titles" do
      subject.any_instance.should_receive(:manifest).and_return(['test-library with_underscores/readme.md'])
      result = subject.new(config).send(:aside_items)
      expect(result).to eql([{id: 'test-library with_underscores', title: "Test Library With Underscores"}])
    end

  end

  describe "#content_sections" do

    it "returns a collection of hashes with parsed content" do
      subject.any_instance.should_receive(:manifest).and_return(['test-library with_underscores/readme.md'])
      Docomo::Parser.any_instance.should_receive(:open_file)
      Docomo::Parser.any_instance.should_receive(:parse).and_return("parsed content")
      result = subject.new(config).send(:content_sections)
      expect(result).to eql([{id: 'test-library with_underscores', content: "parsed content"}])
    end

  end

  describe "#manifest" do

    it "returns a list of files based on the manifest_matcher configuration" do
      result = subject.new(config).send(:manifest)
      expect(result.first).to match(%r(spec/fixtures/sources/readme_button_semigloss.md))
    end

  end

  describe "#template" do

    it "returns the contents of the template" do
      result = subject.new(config).send(:template)
      expect(result).to match(%r(%h1= title))
    end

  end

end
