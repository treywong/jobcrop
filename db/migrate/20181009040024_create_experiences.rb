class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :job_title
      t.string :company_name
      t.string :location
      t.string :specialization
      t.string :role
      t.string :country
      t.integer :monthly_salary
      t.string :postion_level
      t.date :started_at
      t.date :ended_at
      t.text :job_description

      t.belongs_to :user, null: false
      
      t.timestamps
    end
  end
end
