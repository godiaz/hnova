class AddUrlToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :url, :string
  end
end
