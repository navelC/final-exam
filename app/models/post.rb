class Post < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  belongs_to :district
<<<<<<< HEAD
  
  has_and_belongs_to_many :bill

=======

  has_many :bill
>>>>>>> upstream/master

  has_one_attached :image
end
