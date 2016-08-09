class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :multiple_choice_questions, dependent: :destroy
  has_many :number_range_questions, dependent: :destroy

  def has_questions?
    multiple_choice_questions.any? || number_range_questions.any?
  end
end
