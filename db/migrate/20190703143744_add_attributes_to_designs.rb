class AddAttributesToDesigns < ActiveRecord::Migration[5.2]
  def change
    add_column :designs, :title, :string
    add_column :designs, :description, :string
  end
end
