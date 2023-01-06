class PlantsController < ApplicationController
  def create
  end

  def update
    plant = Plant.find(params[:id])
    plant.update!(fixed_params)
  end

  private

  def plant_params
    params.require(:plant).permit(...)
  end

  def fixed_params
    new_hash = Hash.new
    plant_params.each do |k, v|
      if v == '1'
        new_hash[k] = true
      elsif v == '0'
        new_hash[k] = false
      end
    end
    new_hash
  end
end