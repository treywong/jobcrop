class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :role, default: "jobhunter"
    	t.string :email
      t.string :phone
      t.date :birthday
    	t.string :password
    	t.string :detail
    	t.string :image
    	t.string :checklist, array: true

      t.timestamps
    end
  end
end
