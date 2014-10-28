class InterestedContactsController < ApplicationController

  before_filter :find_pet

  def create
    @interested_contact = @adoption_pet.interested_contacts.build(params[:interested_contact])

    if @interested_contact.save
      render @adoption_pet.pet_contact
    else
      render :text => @interested_contact.errors.full_messages.join(", "), :status => :unprocessable_entity
    end
  end

  private

  def find_pet
    @adoption_pet = AdoptionPet.find(params[:adoption_pet_id])
  end
end
