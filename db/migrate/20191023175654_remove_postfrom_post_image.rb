class RemovePostfromPostImage < ActiveRecord::Migration[5.2]
  def change
    remove_reference :post_images, :post, index: true, foreign_key: true
  end
end
