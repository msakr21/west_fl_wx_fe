class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.boolean :medicine, default: false
      t.boolean :food, default: false
      t.boolean :food_water_bowls, default: false
      t.boolean :crate, default: false
      t.boolean :toys, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
