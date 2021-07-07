class ProductSerializer < ActiveModel::Serializer
  attributes :id, :price, :description, :name, :supplier, :images
  belongs_to :supplier
  has_many :images
end
