class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
    	t.string :name
    	t.string :logo #file upload
    	t.string :location
    	t.string :website
    	t.integer :telephone
    	t.integer :company_size
        t.string :industry

    	t.string :overview
    	t.string :join_us
    	t.string :photos, array: true #file upload
    	t.datetime :session, array: true
      t.timestamps
    end
  end
end
