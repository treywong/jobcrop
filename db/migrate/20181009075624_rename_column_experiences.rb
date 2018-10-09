class RenameColumnExperiences < ActiveRecord::Migration[5.2]
  def change
  	rename_column :experiences, :postion_level, :position_level
  end
end
