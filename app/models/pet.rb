class Pet < ActiveRecord::Base
  attr_accessible :age, :animal, :breed, :color, :gender, :location, :marks, :name, :notes, :size, :story

  validates_presence_of :animal, :name

  belongs_to :owner, :polymorphic => :true

  def self.valid_animals
    ["perro", "gato"]
  end
end
