class ProductSerializer < ActiveModel::Serializer
  attributes :id :price :tax :is_discounted :total
end
