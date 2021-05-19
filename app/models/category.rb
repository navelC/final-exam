class Category < ApplicationRecord
 	has_many :brands
<<<<<<< HEAD
 	has_many :posts
=======
>>>>>>> upstream/master

  	validates :brand, presence: true
end
