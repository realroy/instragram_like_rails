class RemoveProductIdFromLike < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :product_id
  end
end
