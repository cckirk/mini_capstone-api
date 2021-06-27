class ProductSerializer < ActiveModel::Serializer
  attributes :id, :price, :description, :name, :supplier, :images
end
