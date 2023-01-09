class KidsController < ApplicationController
  def create
  end

  def update
    kid = Kid.find(params[:id])
    kid.update!(fixed_params)
    redirect_to user_path(kid.user_id)
  end

  private

  def kid_params
    params.require(:kid).permit(:medicine, :toys, :clothing, :medical_records)
  end

  def fixed_params
    new_hash = Hash.new
    kid_params.each do |k, v|
      new_hash[k] = ActiveModel::Type::Boolean.new.cast(v)
    end
    new_hash
  end
end