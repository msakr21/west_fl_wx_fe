class RecordsController < ApplicationController
  def create
    record = Record.create!(fixed_params)
    redirect_to user_path(record.user_id)
  end

  def update
    record = Record.find(params[:id])
    record.update!(fixed_params)
    redirect_to user_path(record.user_id)
  end

  private

  def record_params
    params.require(:record).permit(:medical, :gov_id, :birth_cert, :user_id)
  end

  def fixed_params
    new_hash = {}
    record_params.each do |k, v|
      if k != 'user_id'
        new_hash[k] = ActiveModel::Type::Boolean.new.cast(v)
      elsif k == 'user_id'
        new_hash[k] = v
      end
    end
    new_hash
  end
end
