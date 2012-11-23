class Docomo::LiveController < ActionController::Base

  layout false

  def show
    render text: Docomo::Processor.new.render
  end
end
