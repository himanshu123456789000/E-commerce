class Product < ApplicationRecord
  belongs_to :user
  has_one :cart_item
end
