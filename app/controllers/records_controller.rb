class RecordsController < ApplicationController
  def create
  end

  def update
    record = Record.find(params[:id])
    record.update!(fixed_params)
    redirect_to user_path(record.user_id)
  end

  private

  def record_params
    params.require(:record).permit(:medical, :gov_id, :birth_cert)
  end

  def fixed_params
    new_hash = Hash.new
    record_params.each do |k, v|
      new_hash[k] = ActiveModel::Type::Boolean.new.cast(v)
    end
    new_hash
  end
end