class AddImportanceToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :importance, :integer, default: 0
  end
end
