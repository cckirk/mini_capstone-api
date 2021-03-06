class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  #validates :inventory, numericality:  { only_integer: true }
  validates :description, length: {minimum: 10}
  validates :description, length: {maximum: 500}
  
  belongs_to :supplier
  has_many :orders
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  
  def is_discounted
    if price.to_i < 10
      return true
    else
      return false
    end
  end
  belongs_to :supplier
  has_many :images
 # def supplier
  #  Supplier.find_by(id: supplier_id)
  #end

  def tax
    tax_total = (price * 0.09)
    return tax_total
  end

  def total 
    sum = price + tax
    return sum
  end
end
