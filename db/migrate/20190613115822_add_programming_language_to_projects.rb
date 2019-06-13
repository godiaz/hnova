class AddProgrammingLanguageToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :programming_language, :string
  end
end
