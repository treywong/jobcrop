class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
    	t.references :user, foreign_key: true
    	t.references :job, foreign_key: true
    	t.datetime :booked_at
    	t.string :files, array: true #for documents
    	t.string :detail
      t.timestamps
    end
  end
end
