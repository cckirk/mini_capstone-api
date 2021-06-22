class Product < ApplicationRecord
  def is_discounted
    if price.to_i < 10
      return true
    else
      return false
    end
  end

  def tax
    tax_total = (price.to_f * 0.09)
    return tax_total
  end

  def total 
    sum = price + tax_total
    return sum
  end
end
