class AddSlugToPet < ActiveRecord::Migration
  def change
    add_column :pets, :slug, :string
    add_index :pets, :slug, :unique => true
  end
end
