class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.integer :title
      t.integer :rating, default: 0

      t.timestamps
    end
  end
end
