class ChangePhototoPhotoData < ActiveRecord::Migration[5.2]
  def change
    rename_column :post_images, :photo, :photo_data
  end
end
