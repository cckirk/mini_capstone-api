class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :inventory, numericality:  { only_integer: true }
  validates 
  def is_discounted
    if price.to_i < 10
      return true
    else
      return false
    end
  end

  def tax
    tax_total = (price * 0.09)
    return tax_total
  end

  def total 
    sum = price + tax
    return sum
  end
end
