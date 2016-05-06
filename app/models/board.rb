class Board < ActiveRecord::Base
	validates :title, presence: true, length: {maximum: 50}, uniqueness: { case_sensitive: false }
end