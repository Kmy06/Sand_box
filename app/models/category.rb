class Category < ActiveRecord::Base
	has_many :boards
	validates :title, presence: true, length: {maximum: 50}, uniqueness: { case_sensitive: false }
end