class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
        t.references :post, foreign_key: true
        t.text :photo
      t.timestamps
    end
  end
end
