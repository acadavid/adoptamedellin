class RecommendMailer
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include ActiveModel::AttributeMethods
  extend ActiveModel::Naming
  extend ActiveModel::Translation

  attr_accessor :adoption_pet_id, :name, :friend_name, :friend_email

  validates :name, :presence => true
  validates :friend_name, :presence => true
  validates :friend_email, :presence => true
  validates_format_of :friend_email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i

  def initialize(attributes = {})
    attributes.each do |attr, value|
      send("#{attr}=", value)
    end
  end

  def deliver(adoption_pet)
    if valid?
      FriendMailer.pet_recommendation(adoption_pet,
                                      @name,
                                      @friend_name,
                                      @friend_email).deliver
    else
      false
    end
  end

  def persisted?
    false
  end  

end