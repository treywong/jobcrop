class CreateFreelance < ActiveRecord::Migration[5.2]
  def change
    create_table :freelances do |t|
      t.references :employer

      t.string :description
      t.integer :payment
      t.string :location
      t.string :photos
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
