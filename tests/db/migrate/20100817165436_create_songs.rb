class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.string :title
      t.string :description
      t.integer :length
      t.integer :album_id

      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
