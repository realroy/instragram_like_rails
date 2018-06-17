class AddLikeToPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :like, :integer
  end
end
