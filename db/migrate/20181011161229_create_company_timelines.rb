class CreateCompanyTimelines < ActiveRecord::Migration[5.2]
  def change
    create_table :company_timelines do |t|
    	t.references :company
    	t.string :title
    	t.string :description
    	t.string :photo
      t.timestamps
    end
  end
end
