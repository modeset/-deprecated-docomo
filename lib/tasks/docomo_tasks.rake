namespace :docomo do

  desc "Generate documentation for asset libraries"
  task :generate => :environment do
    Docomo::Processor.new.render_to_file
  end

end
