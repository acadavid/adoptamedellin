class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :file
      t.references :pet

      t.timestamps
    end
    add_index :pictures, :pet_id
  end
end
