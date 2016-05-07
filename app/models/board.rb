class Board < ActiveRecord::Base
	belongs_to :category
	validates :title, presence: true, length: {maximum: 50}, uniqueness: { case_sensitive: false }
end