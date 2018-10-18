class Activity < ApplicationRecord
	belongs_to :action, :polymorphic => true
	has_one :lesson
end
