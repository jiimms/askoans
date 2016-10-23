class User < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	has_secure_password
	validates :name, presence: true
	validates :email, presence: true
	has_many :questions, dependent: :destroy
	has_many :answers

end
