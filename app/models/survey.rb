class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :multiple_choice_questions
  has_many :number_range_questions
end
