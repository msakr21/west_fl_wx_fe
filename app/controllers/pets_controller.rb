class PetsController < ApplicationController
  def create
    pet = Pet.create!(fixed_params)
    redirect_to user_path(pet.user_id)
  end

  def update
    pet = Pet.find(params[:id])
    pet.update!(fixed_params)
    redirect_to user_path(pet.user_id)
  end

  private

  def pet_params
    params.require(:pet).permit(:medicine, :food, :food_water_bowls, :crate, :toys, :user_id)
  end

  def fixed_params
    new_hash = {}
    pet_params.each do |k, v|
      if k != 'user_id'
        new_hash[k] = ActiveModel::Type::Boolean.new.cast(v)
      elsif k == 'user_id'
        new_hash[k] = v
      end
    end
    new_hash
  end
end
