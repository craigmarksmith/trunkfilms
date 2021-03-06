class BlogPost < ActiveRecord::Base

  before_validation :set_permalink
  validates_uniqueness_of :permalink

  def set_permalink
    self.permalink = title.downcase.gsub(/'/,'').gsub(/[^a-z0-9]/,'-').gsub(/-+/,'-')
    self
  end

  def to_param
    permalink
  end

  include BlogHelper
  def to_html
    erb = ERB.new(content)
    RedCloth.new(erb.result(binding)).to_html
  end

end