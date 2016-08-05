class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :title
      t.references :multiple_choice_question, foreign_key: true

      t.timestamps null: false
    end
  end
end
