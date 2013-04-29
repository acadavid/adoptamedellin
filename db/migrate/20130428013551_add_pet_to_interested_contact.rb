class AddPetToInterestedContact < ActiveRecord::Migration
  def change
    change_table :interested_contacts do |t|
      t.references :pet
    end
  end
end
