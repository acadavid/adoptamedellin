class AddOwnerToPets < ActiveRecord::Migration
  def change
    change_table :pets do |t|
      t.references :owner, :polymorphic => true
    end
  end
end
