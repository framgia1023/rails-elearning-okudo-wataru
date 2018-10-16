class Answer < ApplicationRecord
	belongs_to :lesson
	belongs_to :choice
	belongs_to :word
end
