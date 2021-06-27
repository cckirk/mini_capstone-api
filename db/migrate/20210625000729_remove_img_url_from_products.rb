class RemoveImgUrlFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :img_url, :string
  end
end
