class AddMunicipalityToPets < ActiveRecord::Migration
  def change
    add_column :pets, :municipality, :string
  end
end
