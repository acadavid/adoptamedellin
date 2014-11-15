class AddStatusToAdoptionPet < ActiveRecord::Migration
  def change
    add_column :adoption_pets, :status, :string, :default => "pending_approval"
  end
end
