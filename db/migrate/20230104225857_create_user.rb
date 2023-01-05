class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :plan, default: true
      t.boolean :prep_kit, default: true
      t.boolean :records, default: true
      t.boolean :car
      t.boolean :house
      t.boolean :kids
      t.boolean :pets
      t.timestamps
    end
  end
end
