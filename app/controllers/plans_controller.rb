class PlansController < ApplicationController
  def create
    plan = Plan.create!(fixed_params)
    redirect_to user_path(plan.user_id)
  end

  def update
    plan = Plan.find(params[:id])
    plan.update!(fixed_params)
    redirect_to user_path(plan.user_id)
  end

  private

  def plan_params
    params.require(:plan).permit(:review_insurance_docs, :check_evac_zone, :evac_plan, :check_evac_route, :three_days_water, :three_days_food, :user_id)
  end

  def fixed_params
    new_hash = {}
    plan_params.each do |k, v|
      if k != 'user_id'
        new_hash[k] = ActiveModel::Type::Boolean.new.cast(v)
      elsif k == 'user_id'
        new_hash[k] = v
      end
    end
    new_hash
  end
end
