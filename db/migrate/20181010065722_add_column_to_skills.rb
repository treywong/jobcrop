class AddColumnToSkills < ActiveRecord::Migration[5.2]
  def change
  	add_column :skills, :skill_name, :string
  	add_column :skills, :proficiency, :string
  	add_reference :skills, :user
  end
end


