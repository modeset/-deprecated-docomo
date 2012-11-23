require 'spec_helper'

describe Docomo do

  it "has a configuration property" do
    Docomo.configuration.should be(Docomo::Configuration)
  end

  describe ".setup" do

    it "is defined" do
      Docomo.methods.should include(:setup)
    end

    it "yields configuration" do
      config = nil
      Docomo.setup { |c| config = c }
      config.should be(Docomo::Configuration)
    end

  end

end

describe Docomo::Configuration do

  subject { Docomo::Configuration }

  it "allows setting various configuration options" do
    subject.title = "Test Title"
    subject.template_filename = "template.haml"
    subject.output_path = "output/path"
    subject.manifest_matcher = "**/*.md"
    subject.use_pygments = false
    subject.markdown_options = {foo: "bar"}

    expect(subject.title).to eql("Test Title")
    expect(subject.template_filename).to eql("template.haml")
    expect(subject.output_path).to eql("output/path")
    expect(subject.manifest_matcher).to eql("**/*.md")
    expect(subject.use_pygments).to be(false)
    expect(subject.markdown_options).to eql({foo: "bar"})
  end

end
