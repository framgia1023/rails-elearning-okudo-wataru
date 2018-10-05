class User < ApplicationRecord

	before_save {email.downcase!}

	EMAIL_REGAL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :name, presence: true
	validates :email, presence: true,format: { with: EMAIL_REGAL },uniqueness: { case_sensitive: false}

	has_secure_password

	has_many :active_relationships, class_name: "Relationship",
									foreign_key: "follower_id",
									dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed								

	has_many :passive_relationships,	class_name: "Relationship",
										foreign_key: "followed_id",
										dependent: :destroy
	has_many :followers, through: :passive_relationships, source: :follower


	# def follow(other_user)
	# 	following << other_user	
	# 	#active_relationship.create(followed_id: other_user.id)						
	# end	

	# def unfollow(other_user)
	# 	following.delete(other_user)
	# end

	
	def following?(other_user)
		following.include?(other_user)
	end
end
