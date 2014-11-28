class CreateMunicipalities < ActiveRecord::Migration
  def change
    create_table :municipalities do |t|
      t.string :municipality

      t.timestamps
    end
  end
end
