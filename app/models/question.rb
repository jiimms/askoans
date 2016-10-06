class Question < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
  	validates :title, presence: true
  	has_many :answers
end
