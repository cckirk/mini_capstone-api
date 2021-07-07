class CartedProduct < ApplicationRecord
  belongs_to :order, optional: true
end
