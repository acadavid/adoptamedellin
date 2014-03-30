class FriendMailer < ActionMailer::Base
  default from: "AdoptaMedellin.com <contacto@adoptamedellin.com>"

  def pet_recommendation(pet_id, user_name, friend_name, friend_email)
    @pet = AdoptionPet.find pet_id
    @user_name = user_name
    @friend_name = friend_name
    mail(to: friend_email, subject: "#{@friend_name}, adopta esta mascota!")
  end
end
