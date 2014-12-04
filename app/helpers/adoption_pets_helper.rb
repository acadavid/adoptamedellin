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

  def load_index_picture(pet)
    pic_file = pet.pictures.first.file

    if pet.adopted?
      image_tag pic_file.adopted.url, alt: "Vista previa de la foto de una mascota en adopción"
    else
      image_tag pic_file.index.url, alt: "Vista previa de la foto de una mascota en adopción"
    end
  end

  private
  def previous_pet(adoption_pet)
    @previous_pet = AdoptionPet.previous_pet(adoption_pet).recently_created
    if logged_in?
      @previous_pet.limit(1).first
    else
      @previous_pet.not_adopted_pets.limit(1).first
    end 
  end

  def next_pet(adoption_pet)
    @previous_pet = AdoptionPet.next_pet(adoption_pet)
    if logged_in?
      @previous_pet.limit(1).first
    else
      @previous_pet.not_adopted_pets.limit(1).first
    end
  end
end
