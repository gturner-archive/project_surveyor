class CreateNumberRangeQuestions < ActiveRecord::Migration
  def change
    create_table :number_range_questions do |t|
      t.string :title
      t.integer :min
      t.integer :max
      t.boolean :required
      t.references :survey, foreign_key: true

      t.timestamps null: false
    end
  end
end
