class ApplicationController < ActionController::Base
  protect_from_forgery

  def contact
  	render 'others/contact'
  end

  def faq
  	render 'others/faq'
  end
end
