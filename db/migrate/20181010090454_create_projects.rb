class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :image
      t.string :project_details
      t.references :user
      t.timestamps
    end
  end
end
