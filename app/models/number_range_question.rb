class NumberRangeQuestion < ActiveRecord::Base
  belongs_to :survey
  has_many :responses, :as => :answerable
end
