class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.boolean :medical, default: false
      t.boolean :gov_id, default: false
      t.boolean :birth_cert, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
