class Product < ApplicationRecord
  def is_discounted
    if price < 10
      return true
    else
      return false
    end

    def tax
      tax = (price.to_f * .09)
      return tax
    end

    def total 
        sum = price + price.tax
        return sum
    end
  end
end
