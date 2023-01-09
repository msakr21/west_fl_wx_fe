class KidsController < ApplicationController
  def create
    kid = Kid.create!(fixed_params)
    redirect_to user_path(kid.user_id)
  end

  def update
    kid = Kid.find(params[:id])
    kid.update!(fixed_params)
    redirect_to user_path(kid.user_id)
  end

  private

  def kid_params
    params.require(:kid).permit(:medicine, :toys, :clothing, :medical_records, :user_id)
  end

  def fixed_params
    new_hash = Hash.new
    kid_params.each do |k, v|
      if k != 'user_id'
        new_hash[k] = ActiveModel::Type::Boolean.new.cast(v)
      elsif k == 'user_id'
        new_hash[k] = v
      end
    end
    new_hash
  end
end