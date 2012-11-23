require 'spec_helper'

describe Docomo::Render do

  subject { Docomo::Render }

  describe "#link" do

    it "sets target=_blank when appropriate" do
      result = subject.new.link('http://github.com', 'title', 'alt text')
      expect(result).to eql("<a target=\"_blank\" href=\"http://github.com\" title=\"title\">alt text</a>")

      result = subject.new.link('/path', 'title', 'alt text')
      expect(result).to eql("<a href=\"/path\" title=\"title\">alt text</a>")
    end

  end

end
