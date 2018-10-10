class RemoveColumnFromExperiences < ActiveRecord::Migration[5.2]
  def change
    remove_column :experiences, :currently_working, :boolean
  end
end
