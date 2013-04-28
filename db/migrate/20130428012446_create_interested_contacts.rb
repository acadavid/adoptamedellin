class CreateInterestedContacts < ActiveRecord::Migration
  def change
    create_table :interested_contacts do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
