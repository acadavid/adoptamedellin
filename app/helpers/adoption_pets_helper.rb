module AdoptionPetsHelper

  def previous_pet_link(adoption_pet)
    unless previous_pet(adoption_pet).nil?
      link_to adoption_pet_path(previous_pet(adoption_pet)), class: "arrow arrow_left" do
        "#{content_tag(:i, '', :class=>'previous')} Anterior".html_safe
      end
    end
  end

  def next_pet_link(adoption_pet)
    unless next_pet(adoption_pet).nil?
      link_to adoption_pet_path(next_pet(adoption_pet)), class: "arrow arrow_right" do
        "Siguiente #{content_tag(:i, '', :class=>'next')}".html_safe
      end
    end
  end

  private
  def previous_pet(adoption_pet)
    @previous_pet = AdoptionPet.previous_pet(adoption_pet).recent
    if logged_in?
      @previous_pet.limit(1).first
    else
      @previous_pet.unadopted_pets.limit(1).first
    end 
  end

  def next_pet(adoption_pet)
    @previous_pet = AdoptionPet.next_pet(adoption_pet)
    if logged_in?
      @previous_pet.limit(1).first
    else
      @previous_pet.unadopted_pets.limit(1).first
    end
  end
end
