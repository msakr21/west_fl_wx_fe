class PetsController < ApplicationController
  def create
  end

  def update
    pet = Pet.find(params[:id])
    pet.update!(fixed_params)
    redirect_to user_path(pet.user_id)
  end

  private

  def pet_params
    params.require(:pet).permit(:medicine, :food, :food_water_bowls, :crate, :toys)
  end

  def fixed_params
    new_hash = Hash.new
    pet_params.each do |k, v|
      new_hash[k] = ActiveModel::Type::Boolean.new.cast(v)
    end
    new_hash
  end
end