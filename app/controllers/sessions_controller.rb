class SessionsController < ApplicationController

  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :success => "Logged as administrator."
    else
      flash.now[:error] = "Email or password was invalid"
      render :new
    end
  end

  def destroy
  logout
    redirect_to root_url, :notice => "Logged out!"
  end
end
