class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.boolean :gas, default: false
      t.boolean :maintenance, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
