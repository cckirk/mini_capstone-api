class MakeChangesToProducts < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :price, "numeric USING CAST(price AS numeric)"
    change_column :products, :price, :decimal
  end
end
