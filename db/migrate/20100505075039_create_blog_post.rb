class CreateBlogPost < ActiveRecord::Migration
  def self.up
    create_table :blog_posts, :force => true do |t|
      t.string :title
      t.text :content
      t.string :permalink
      t.timestamps
    end
  end

  def self.down
    drop_table :blog_posts
  end
end
