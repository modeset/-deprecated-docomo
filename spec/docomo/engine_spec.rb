require 'spec_helper'

describe Docomo::Engine do

  it "is a class" do
    Docomo::Engine.should be_a(Class)
  end

  it "has been isolated with a name" do
    expect(Docomo::Engine.isolated?).to be(true)
    expect(Docomo::Engine.railtie_name).to eql('docomo')
  end

end
