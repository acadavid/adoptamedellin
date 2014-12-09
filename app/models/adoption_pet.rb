class AdoptionPet < ActiveRecord::Base
  
  STATES = ["pending_approval","not_adopted","adopted"]

  attr_accessible :like_kids, :neutered, :temperament, :vaccines, :status, :pet_attributes

  has_one :pet, :dependent => :destroy, :as => :owner

  validates :pet, :presence => true

  accepts_nested_attributes_for :pet

  after_create :create_asana_task

  delegate :name, :age, :animal, :size, :pictures, :pet_contact, :interested_contacts, :gender, :location, :breed, :story, :municipality, :to => :pet

  scope :exclude_pending_approval_pets, -> { where("status != 'pending_approval'") }
  scope :previous_pet, -> (adoption_pet) { where('created_at < ?', adoption_pet.created_at) }
  scope :next_pet, -> (adoption_pet) { where('created_at > ?', adoption_pet.created_at) }
  scope :recently_created, -> { order("created_at DESC") }

  STATES.each do |status|
    define_method "#{status}?" do
      self.status.eql? status
    end
  end

  private
  def create_asana_task
    route_to_adoption_pet = Rails.application.routes.url_helpers.adoption_pet_url(self)

    task_name = "Agregar mascota #{self.name}"
    taks_notes = "Una nueva mascota ha sido creada, revisar el perfil en #{route_to_adoption_pet}"

    Asana::Task.create(task_name, taks_notes)
  end
end
