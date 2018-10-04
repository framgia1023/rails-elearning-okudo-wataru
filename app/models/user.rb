class User < ApplicationRecord

	before_save {email.downcase!}

	EMAIL_REGAL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :name, presence: true
	validates :email, presence: true,format: { with: EMAIL_REGAL },uniqueness: { case_sensitive: false}

	has_secure_password
end
