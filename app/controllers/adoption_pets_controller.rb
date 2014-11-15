# -*- coding: utf-8 -*-
class AdoptionPetsController < ApplicationController

  respond_to :html

  before_filter :require_login, :only => [:edit, :update, :destroy]

  def index
    if logged_in?
      @pets = AdoptionPet.page(params[:page]).per(6)
    else
      @pets = AdoptionPet.page(params[:page]).per(6).unadopted_pets
    end

    respond_with @pets
  end

  def show
    @adoption_pet = AdoptionPet.find(params[:id])
    @interested_contact = InterestedContact.new
    @friend_mailer = RecommendMailer.new

    respond_with @adoption_pet
  end

  def new
    @adoption_pet = AdoptionPet.new
    @adoption_pet.pet = Pet.new
    @adoption_pet.pet.pet_contact = PetContact.new

    respond_with @adoption_pet
  end

  def edit
    @adoption_pet = AdoptionPet.find(params[:id])
  end

  def create
    @adoption_pet = AdoptionPet.new(params[:adoption_pet])

    if @adoption_pet.save
      flash[:notice] = "La publicación fue creada, nuestro equipo revisará la publicación y te enviaremos un correo cuando esté lista. No tardaremos, lo prometemos. Gracias!"
      redirect_to :action => "index"
    else
      flash.now[:error] = "La publicación no pudo ser creada"
      render :action => "new"
    end
  end

  def update
    @adoption_pet = AdoptionPet.find(params[:id])
    if @adoption_pet.update_attributes(params[:adoption_pet])
      flash[:notice] = 'La publicación fue actualizada exitosamente'
      redirect_to @adoption_pet
    else
      flash[:error] = 'La publicación no pudo ser actualizada'
      render :action => "edit"
    end
  end

  def destroy
    @adoption_pet = AdoptionPet.find(params[:id])
    @adoption_pet.destroy
    flash.now[:notice] = 'La publicación fue eliminada exitosamente'
    redirect_to adoption_pets_url
  end

  def recommend
    @friend_mailer = RecommendMailer.new(params[:recommend_mailer])
    @adoption_pet = AdoptionPet.find(params[:adoption_pet_id])
    @interested_contact = InterestedContact.new

    if @friend_mailer.deliver(@adoption_pet)
      flash.now[:success] = "Hemos enviado la mascota a tu amigo! Gracias por ayudar!"
    else
      flash.now[:error] = "El correo no pudo ser enviado"
    end
    
    render :action => "show"
  end
end
