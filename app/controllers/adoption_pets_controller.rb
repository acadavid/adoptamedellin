# -*- coding: utf-8 -*-
class AdoptionPetsController < ApplicationController

  respond_to :html

  def index
    @pets = AdoptionPet.all

    respond_with @pets
  end

  def show
    @adoption_pet = AdoptionPet.find(params[:id])

    respond_with @adoption_pet
  end

  def new
    @adoption_pet = AdoptionPet.new

    respond_with @adoption_pet
  end

  def edit
    @adoption_pet = AdoptionPet.find(params[:id])
  end

  def create
    @adoption_pet = AdoptionPet.new(params[:adoption_pet])

    if @adoption_pet.save
      flash[:notice] = "La publicación fue creada exitosamente! Gracias!"
      redirect_to @adoption_pet
    else
      flash[:error] = "La publicación no pudo ser creada"
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
    flash[:notice] = 'La publicación fue eliminada exitosamente'
    redirect_to adoption_pets_url
  end
end
