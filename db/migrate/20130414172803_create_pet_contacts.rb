class CreatePetContacts < ActiveRecord::Migration
  def change
    create_table :pet_contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :mobile
      t.references :pet

      t.timestamps
    end
  end
end
