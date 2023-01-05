class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :plan
      t.boolean :prep_kit
      t.boolean :records
      t.boolean :car
      t.boolean :house
      t.boolean :kids
      t.boolean :pets
      t.timestamps
    end
  end
end
