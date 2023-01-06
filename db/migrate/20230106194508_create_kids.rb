class CreateKids < ActiveRecord::Migration[5.2]
  def change
    create_table :kids do |t|
      t.boolean :medicine, default: false
      t.boolean :toys, default: false
      t.boolean :clothing, default: false
      t.boolean :medical_records, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
