class Word < ApplicationRecord
	belongs_to :category
	has_many :choices
	validates :content, presence: true

	accepts_nested_attributes_for :choices
end
