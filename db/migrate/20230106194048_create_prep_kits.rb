class CreatePrepKits < ActiveRecord::Migration[5.2]
  def change
    create_table :prep_kits do |t|
      t.boolean :batteries, default: false
      t.boolean :first_aid_kit, default: false
      t.boolean :toiletries, default: false
      t.boolean :cash, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
