class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :multiple_choice_questions
  has_many :number_range_questions
  accepts_nested_attributes_for :number_range_questions, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :multiple_choice_questions, :reject_if => :all_blank, :allow_destroy => true
end
