class AddColumnToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :currently_working, :integer, default: 0
  end
end
