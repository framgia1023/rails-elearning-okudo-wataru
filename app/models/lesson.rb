class Lesson < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :answers
	
	has_one :activity, :as => :action

	has_many :words, through: :answers
	has_many :choices, through: :answers
end
