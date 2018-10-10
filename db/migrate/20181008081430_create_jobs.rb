class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
    	t.references :company, foreign_key: true
    	t.string :name
      t.string :work_location
    	t.string :description
      t.string :responsibility
      t.integer :work_hour_start
      t.integer :work_hour_end
    	t.integer :salary
    	t.string :image
    	

      t.timestamps
    end
  end
end
