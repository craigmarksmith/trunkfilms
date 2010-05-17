class Movie < ActiveRecord::Base

  before_validation :set_permalink
  validates_uniqueness_of :permalink

  def set_permalink
    self.permalink = title.downcase.gsub(/'/,'').gsub(/[^a-z0-9]/,'-').gsub(/-+/,'-')
    self
  end

  def to_param
    permalink
  end

  def validate
    if (image_url && image_url.empty?) && (vimeo_clip_id && vimeo_clip_id.empty?)
      errors.add(:vimeo_clip_id, "Can't have both vimeo_clip_id and image_url")
    end

    if (image_url && !image_url.empty?) || (movie_url && !movie_url.empty?)
      if (image_url && image_url.empty?) || (movie_url && movie_url.empty?)
        errors.add(:image_url, "Must set both image_url and movie_url")
      end
    end
  end

  def is_vimeo?
    vimeo_clip_id && !vimeo_clip_id.empty?
  end
end