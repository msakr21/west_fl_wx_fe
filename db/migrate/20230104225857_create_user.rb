class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :plan_table, default: true
      t.boolean :prep_kit_table, default: true
      t.boolean :records_table, default: true
      t.boolean :car_table, default: false
      t.boolean :house_table, default: false
      t.boolean :kids_table, default: false
      t.boolean :pets_table, default: false
      t.timestamps
    end
  end
end
