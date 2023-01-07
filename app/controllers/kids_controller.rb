class KidsController < ApplicationController
  def create
  end

  def update
    kid = Kid.find(params[:id])
    kid.update!(fixed_params)
  end

  private

  def kid_params
    params.require(:kid).permit(:medicine, :toys, :clothing, :medical_records)
  end

  def fixed_params
    new_hash = Hash.new
    kid_params.each do |k, v|
      if v == '1'
        new_hash[k] = true
      elsif v == '0'
        new_hash[k] = false
      end
    end
    new_hash
  end
end