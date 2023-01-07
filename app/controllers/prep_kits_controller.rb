class PrepKitsController < ApplicationController
  def create
  end

  def update
    prep_kit = PrepKits.find(params[:id])
    prep_kit.update!(fixed_params)
  end

  private

  def prep_kit_params
    params.require(:prep_kit).permit(:batteries, :first_aid_kit, :toiletries, :toiletries, :cash)
  end

  def fixed_params
    new_hash = Hash.new
    prep_kit_params.each do |k, v|
      if v == '1'
        new_hash[k] = true
      elsif v == '0'
        new_hash[k] = false
      end
    end
    new_hash
  end
end