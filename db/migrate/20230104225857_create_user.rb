class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :plan, default: true
      t.boolean :prep_kit, default: true
      t.boolean :records, default: true
      t.boolean :car, default: false
      t.boolean :house, default: false
      t.boolean :kids, default: false
      t.boolean :pets, default: false
      t.timestamps
    end
  end
end
