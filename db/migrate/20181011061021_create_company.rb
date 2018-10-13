class CreateCompany < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.references :employer

      t.string :name
      t.string :website
      t.string :telephone
      t.string :background
      t.string :location
      t.string :size
      t.string :logo

      t.timestamps
    end
  end
end
