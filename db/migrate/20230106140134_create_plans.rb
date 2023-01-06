class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.boolean :review_insurance_docs, default: false
      t.boolean :check_evac_zone, default: false
      t.boolean :evac_plan, default: false
      t.boolean :check_evac_route, default: false
      t.boolean :three_days_water, default: false
      t.boolean :three_days_food, default: false

      t.timestamps
    end
  end
end
