class Activity < ApplicationRecord
	belongs_to :action, :polymorphic => true
end
