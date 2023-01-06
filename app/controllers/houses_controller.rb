class HousesController < ApplicationController
  def create
  end

  def update
    house = House.find(params[:id])
    house.update!(fixed_params)
  end

  private

  def house_params
    params.require(:house).permit(...)
  end

  def fixed_params
    new_hash = Hash.new
    house_params.each do |k, v|
      if v == '1'
        new_hash[k] = true
      elsif v == '0'
        new_hash[k] = false
      end
    end
    new_hash
  end
end