require 'open-uri'
require 'nokogiri'

desc "sincronize vimeo data with local"
task :sinc => :environment do
  doc = Nokogiri::HTML(open("http://vimeo.com/api/v2/trunkfilms/all_videos.xml"))
  doc.css('video').each do |e|
    movie = Movie.find_by_vimeo_clip_id(e.css('id').text.to_i)
    movie.update_attributes!({'title' => e.css('title').text, 'description' => e.css('description').text}) if movie
  end
end