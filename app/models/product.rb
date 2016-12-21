class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_details, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
end
