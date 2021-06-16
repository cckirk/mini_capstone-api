class CreateProduct2s < ActiveRecord::Migration[6.1]
  def change
    create_table :product2s do |t|
      t.string :name
      t.integer :price
      t.string :img_url
      t.string :description

      t.timestamps
    end
  end
end
