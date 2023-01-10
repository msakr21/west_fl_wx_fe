class PrepKitsController < ApplicationController
  def create
    prep_kit = PrepKit.create!(fixed_params)
    redirect_to user_path(prep_kit.user_id)
  end

  def update
    prep_kit = PrepKit.find(params[:id])
    prep_kit.update!(fixed_params)
    redirect_to user_path(prep_kit.user_id)
  end

  private

  def prep_kit_params
    params.require(:prep_kit).permit(:batteries, :first_aid_kit, :toiletries, :toiletries, :cash, :user_id)
  end

  def fixed_params
    new_hash = {}
    prep_kit_params.each do |k, v|
      if k != 'user_id'
        new_hash[k] = ActiveModel::Type::Boolean.new.cast(v)
      elsif k == 'user_id'
        new_hash[k] = v
      end
    end
    new_hash
  end
end
