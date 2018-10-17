class CreateJob < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.references :company

      t.string :title
      t.string :field
      t.integer :salary
      t.string :details
      t.string :address
      t.string :state
      t.string :zipcode
      t.string :country
      t.string :photos

      t.timestamps
    end
  end
end
