class AddObjectiveToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :objective, :string
  end
end
