class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :animal, :null => false
      t.string :name, :null => false
      t.string :age
      t.string :gender
      t.string :size
      t.string :breed
      t.string :color
      t.string :location
      t.text :marks
      t.text :notes
      t.text :story

      t.timestamps
    end
  end
end
