class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.boolean :trim_trees, default: false
      t.boolean :clear_yard, default: false
      t.boolean :shutters, default: false
      t.boolean :fill_bathtub, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
