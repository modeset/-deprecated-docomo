require 'spec_helper'

describe Docomo do

  it "is a module" do
    Docomo.should be_a(Module)
  end

  it "has a version" do
    Docomo::VERSION.should be_a(String)
  end

end
