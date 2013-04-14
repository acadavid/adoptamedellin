class CreateAdoptionPets < ActiveRecord::Migration
  def change
    create_table :adoption_pets do |t|
      t.boolean :vaccines
      t.boolean :neutered
      t.text :temperament
      t.boolean :like_kids

      t.timestamps
    end
  end
end
