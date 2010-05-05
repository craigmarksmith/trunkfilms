class BlogPost < ActiveRecord::Base

  include BlogHelper

  def to_html
    erb = ERB.new(content)
    RedCloth.new(erb.result(binding)).to_html
  end

end