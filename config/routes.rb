Docomo::Engine.routes.draw do

  match '/live(/:section)' => 'live#show'

end
