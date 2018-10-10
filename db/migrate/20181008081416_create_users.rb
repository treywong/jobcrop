class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.references :company, foreign_key: true #employer only
    	t.string :fullname
    	t.string :role
    	t.string :email
    	t.string :password
    	t.string :password_digest
    	t.string :detail
    	t.string :image
    	t.string :checklist, array: true

      t.timestamps
    end
  end
end
