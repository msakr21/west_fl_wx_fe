class HousesController < ApplicationController
  def create
    house = House.create!(fixed_params)
    redirect_to user_path(house.user_id)
  end

  def update
    house = House.find(params[:id])
    house.update!(fixed_params)
    redirect_to user_path(house.user_id)
  end

  private

  def house_params
    params.require(:house).permit(:trim_trees, :clear_yard, :shutters, :fill_bathtub, :user_id)
  end

  def fixed_params
    new_hash = Hash.new
    house_params.each do |k, v|
      if k != 'user_id'
        new_hash[k] = ActiveModel::Type::Boolean.new.cast(v)
      elsif k == 'user_id'
        new_hash[k] = v
      end
    end
    new_hash
  end
end