require 'movie'
class AddPermalinkToMovie < ActiveRecord::Migration
  def self.up
    add_column :movies, :permalink, :string
  end

  def self.down
    remove_column :movies, :permalink
  end
end
