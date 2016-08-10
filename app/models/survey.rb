class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :multiple_choice_questions, dependent: :destroy
  has_many :number_range_questions, dependent: :destroy
  has_many :mcq_responses, through: :multiple_choice_questions, source: :responses
  has_many :nrq_responses, through: :number_range_questions, source: :responses

  def has_questions?
    multiple_choice_questions.any? || number_range_questions.any?
  end

end
