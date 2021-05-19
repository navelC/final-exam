class Brand < ApplicationRecord
  belongs_to :category
  has_many :posts

  validates :post, presence: true
end
