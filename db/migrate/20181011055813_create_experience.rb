class CreateExperience < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.references :user

      t.string :title
      t.string :company
      t.string :location
      t.integer :salary
      t.date :start_date
      t.date :end_date
      t.string :description
      t.integer :currently_working

      t.timestamps
    end
  end
end
