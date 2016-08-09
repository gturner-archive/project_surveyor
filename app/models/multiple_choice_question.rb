class MultipleChoiceQuestion < ActiveRecord::Base
  belongs_to :survey
  has_many :options, dependent: :destroy
  has_many :responses, :as => :answerable
  
  def number_questions
    true
  end

end
