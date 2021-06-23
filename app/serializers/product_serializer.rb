class ProductSerializer < ActiveModel::Serializer
  attributes :id, :price, :tax, :is_discounted, :total, :description, :img_url, :name
end
