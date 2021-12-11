class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :duration
      t.integer :rating, default: 0
      t.integer :progress, default: 0

      t.timestamps
    end
  end
end
