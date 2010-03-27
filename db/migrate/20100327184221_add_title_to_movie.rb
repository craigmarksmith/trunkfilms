class AddTitleToMovie < ActiveRecord::Migration
  def self.up
    add_column :movies, :title, :string
    add_column :movies, :description, :text
  end

  def self.down
    remove_column :movies, :description
    remove_column :movies, :title
  end
end
