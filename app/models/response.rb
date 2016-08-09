class Response < ActiveRecord::Base
  belongs_to :answerable, :polymorphic => true
end
