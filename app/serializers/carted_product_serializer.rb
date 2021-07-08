class CartedProductSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :user_id, :status, :order_id
end
