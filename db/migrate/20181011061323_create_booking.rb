class CreateBooking < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :job
      t.references :jobhunter

      t.string :session
      t.string :files
      t.string :details

      t.timestamps
    end
  end
end
