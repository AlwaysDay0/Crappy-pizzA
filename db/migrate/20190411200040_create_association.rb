
class CreateAssociation < ActiveRecord::Migration[5.2]
  def change
    create_table :associations do |t|
      t.references :album, foreign_key: true
      t.references :song, foreign_key: true
      t.references :artist, foreign_key: true
    end
  end
end