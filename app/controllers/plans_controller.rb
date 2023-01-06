class PlansController < ApplicationController
  def create

  end

  def update
    plan = Plan.find(params[:id])
    plan.update!(fixed_params)
  end

  private

  def plan_params
    params.require(:plan).permit(:review_insurance_docs, :check_evac_zone)
  end

  def fixed_params
    new_hash = Hash.new
    plan_params.each do |k, v|
      if v == '1'
        new_hash[k] = true
      elsif v == '0'
        new_hash[k] = false
      end
    end
    new_hash
  end
end