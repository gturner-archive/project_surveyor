class Response < ActiveRecord::Base
  belongs_to :answerable, :polymorphic => true
  validates :value, presence: true
end
