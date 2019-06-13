class AddComponentsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :components, :string
  end
end
