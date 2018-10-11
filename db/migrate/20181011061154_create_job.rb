class CreateJob < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.references :company

      t.string :title
      t.integer :salary
      t.string :details
      t.string :location
      t.string :photos

      t.timestamps
    end
  end
end
