class MultipleChoiceQuestion < ActiveRecord::Base
  belongs_to :survey
  has_many :options

  def number_questions
    true
  end

end
