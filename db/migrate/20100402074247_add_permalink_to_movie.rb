require 'movie'
class AddPermalinkToMovie < ActiveRecord::Migration
  def self.up
    add_column :movies, :permalink, :string
    
    Movie.all.each {|m| m.set_permalink.save}
  end

  def self.down
    remove_column :movies, :permalink
  end
end
