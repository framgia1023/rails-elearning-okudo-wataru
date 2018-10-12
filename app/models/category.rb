class Category < ApplicationRecord

	has_many :words
	has_many :lessons

	validates :title, presence: true, length: { maximum: 30}
	validates :description, presence: true, length: { maximum: 200}

end
