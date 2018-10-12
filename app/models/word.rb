class Word < ApplicationRecord
	belongs_to :category
	has_many :choices
	validates :content, presence: true
	validate :check_choice

	accepts_nested_attributes_for :choices

	private

	def check_choice

	correct = choices.collect{ |c| c.correct || nil}.compact

		if correct.size == 0
			errors.add(:choices, "1  choice is better sir")
		elsif correct.size > 1
			errors.add(:choices, "1  choice")
		end

	end
end