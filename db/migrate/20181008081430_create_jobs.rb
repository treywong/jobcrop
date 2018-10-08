class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
    	t.references :user, foreign_key: true
    	t.string :name
    	t.string :description
    	t.string :requirement
    	t.integer :salary
    	t.string :image
    	t.datetime :session, array: true

      t.timestamps
    end
  end
end
