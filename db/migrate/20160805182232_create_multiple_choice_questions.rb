class CreateMultipleChoiceQuestions < ActiveRecord::Migration
  def change
    create_table :multiple_choice_questions do |t|
      t.string :title
      t.boolean :multiple_choices
      t.boolean :required
      t.references :survey, foreign_key: true

      t.timestamps null: false
    end
  end
end
