module AdoptionPetsHelper

  def previous_pet_link(adoption_pet)
    unless previous_pet(adoption_pet).nil?
      link_to adoption_pet_path(previous_pet(adoption_pet)), class: "arrow left" do
        "#{content_tag(:i, '', :class=>'previous')} Anterior".html_safe
      end
    end
  end

  def next_pet_link(adoption_pet)
    unless next_pet(adoption_pet).nil?
      link_to adoption_pet_path(next_pet(adoption_pet)), class: "arrow right" do
        "Siguiente #{content_tag(:i, '', :class=>'next')}".html_safe
      end
    end
  end

  private
  def previous_pet(adoption_pet)
    AdoptionPet.where("created_at < ?", adoption_pet.created_at).order('created_at DESC').limit(1).first
  end

  def next_pet(adoption_pet)
    AdoptionPet.where("created_at > ?", adoption_pet.created_at).limit(1).first
  end
end
