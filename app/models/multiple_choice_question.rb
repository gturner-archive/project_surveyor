class MultipleChoiceQuestion < ActiveRecord::Base
  belongs_to :survey
  has_many :options
end
