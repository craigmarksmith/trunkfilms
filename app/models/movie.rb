class Movie < ActiveRecord::Base

  before_save :set_permalink

  def set_permalink
    self.permalink = title.downcase.gsub(/'/,'').gsub(/[^a-z0-9]/,'-').gsub(/-+/,'-')
    self
  end

  def to_param
    permalink
  end
end