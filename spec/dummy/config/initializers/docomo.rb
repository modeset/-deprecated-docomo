Docomo.setup do |config|

  config.root = Rails.root
  config.title = "Utensils Documentation"
  config.manifest_matcher = ["app/assets/utensils/**/*.md"]
  config.use_pygments = false

end
