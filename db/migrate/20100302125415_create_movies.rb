class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies, :force => true do |t|
      t.string :vimeo_clip_id
      t.integer :sequence_number
      t.timestamps
    end
    
    ['8042205',
    '9182340',
    '8408186',
    '7941668',
    '7781274',
    '7044832'].each do |id|
      Movie.create!(:vimeo_clip_id => id)
    end
    
  end

  def self.down
    drop_table :movies
  end
end
