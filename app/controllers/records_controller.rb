class RecordsController < ApplicationController
  def create
  end

  def update
    record = Record.find(params[:id])
    record.update!(fixed_params)
  end

  private

  def record_params
    params.require(:record).permit(:medical, :gov_id, :birth_cert)
  end

  def fixed_params
    new_hash = Hash.new
    record_params.each do |k, v|
      if v == '1'
        new_hash[k] = true
      elsif v == '0'
        new_hash[k] = false
      end
    end
    new_hash
  end
end