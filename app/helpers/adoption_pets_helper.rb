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

  def hide_element_single_photo(adoption_pet)
    "display: none;" if adoption_pet.pictures.size == 1
  end

  private
  def previous_pet(adoption_pet)
    @previous_pet = AdoptionPet.previous_pet(adoption_pet).recently_created
    if logged_in?
      @previous_pet = @previous_pet.limit(1).first
    else
      @previous_pet = @previous_pet.unadopted_pets.limit(1).first
    end 
    @previous_pet.slug unless @previous_pet.nil?
  end

  def next_pet(adoption_pet)
    @next_pet = AdoptionPet.next_pet(adoption_pet)
    if logged_in?
      @next_pet = @next_pet.limit(1).first
    else
      @next_pet = @next_pet.unadopted_pets.limit(1)
    end
    @next_pet.slug unless @next_pet.nil?
  end
end
