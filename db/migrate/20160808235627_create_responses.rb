class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :value
      t.references :user, index: true, foreign_key: true
      t.integer :answerable_id
      t.string :answerable_type

      t.timestamps null: false
    end
  end
end
