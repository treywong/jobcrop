class CreateJobhunter < ActiveRecord::Migration[5.2]
  def change
    create_table :jobhunters do |t|
      t.references :user

      t.string :preferences
      t.string :title_expectation
      t.string :salary_expectation

      t.timestamps
    end
  end
end
