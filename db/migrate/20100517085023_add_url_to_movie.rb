class AddUrlToMovie < ActiveRecord::Migration
  def self.up
    add_column :movies, :image_url, :string
    add_column :movies, :movie_url, :string
  end

  def self.down
    remove_column :movies, :movie_url
    remove_column :movies, :image_url
  end
end
