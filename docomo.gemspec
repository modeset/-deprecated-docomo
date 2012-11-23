$:.push File.expand_path("../lib", __FILE__)

require "docomo/version"

Gem::Specification.new do |s|
  s.name           = "docomo"
  s.version        = Docomo::VERSION
  s.authors        = ["mkitt", "jejacks0n"]
  s.email          = ["info@modeset.com"]
  s.homepage       = "http://modeset.com"
  s.summary        = "Docomo: Generate awesome documentation for your rails assets."
  s.description    = "Docomo serves live, or generates static documentation for rails assets using markdown and generates html or haml live examples."

  s.files          = Dir["{app,config,lib}/**/*"] + ["LICENSE", "README.md"]
  s.test_files     = Dir["spec/**/*"]
  s.require_paths  = %w(lib)

  s.add_dependency "railties", ">= 3.2.3"
  s.add_dependency "pygments.rb", ">= 0.3.2"
  s.add_dependency "redcarpet", ">= 2.2.2"
  s.add_dependency "haml", ">= 3.1.7"

  s.add_development_dependency "rspec-rails", ">= 2.11.4"
end
