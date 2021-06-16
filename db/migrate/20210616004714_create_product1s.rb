class CreateProduct1s < ActiveRecord::Migration[6.1]
  def change
    create_table :product1s do |t|
      t.string :name
      t.string :price
      t.string :img_url
      t.string :description

      t.timestamps
    end
  end
end
