class CreateEmployer < ActiveRecord::Migration[5.2]
  def change
    create_table :employers do |t|
      t.references :user

      t.string :title
      t.string :preferences

      t.timestamps
    end
  end
end
