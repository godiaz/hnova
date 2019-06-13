class AddTechnologyToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :technology, :string
  end
end
