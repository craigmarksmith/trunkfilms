# require 'spriter'
# namespace :spriter do
#   desc "Generates CSS files and a sprite image from all .spriter files"
#   task :generate => :environment do
#     Spriter.assets_path = File.join(Rails.root, *%w[ public images sprite_assets ])
#     Spriter.sprite_image_path = File.join(Rails.root, *%w[ public images sprites.png ])
#     Spriter.sprite_image_url = "/images/sprites.png?t=#{Time.now.to_i}"
# 
#     paths = Dir.glob(File.join(Rails.root, 'public', 'stylesheets', '*.spriter'))
#     paths.sort!
#     Spriter.transform_files(*paths)
#   end
# end
