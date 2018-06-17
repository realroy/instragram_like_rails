class RemoveLikeFromPictures < ActiveRecord::Migration[5.2]
  def change
    remove_column :pictures, :like
  end
end
