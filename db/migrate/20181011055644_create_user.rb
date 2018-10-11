class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :email
      t.string :phone
      t.string :avatar
      t.string :password
      t.string :about_me
      t.string :address
      t.string :state
      t.string :zipcode
      t.string :country

      t.timestamps
    end
  end
end
