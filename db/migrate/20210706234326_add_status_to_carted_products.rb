class AddStatusToCartedProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :carted_products, :status, :string
    add_column :carted_products, :order_id, :integer
  end
end
