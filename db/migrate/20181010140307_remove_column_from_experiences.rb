class RemoveColumnFromExperiences < ActiveRecord::Migration[5.2]
  def change
    remove_column :experiences, :specialization, :string
    remove_column :experiences, :role, :string
    remove_column :experiences, :position_level, :string
  end
end
