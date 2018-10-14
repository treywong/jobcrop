class CreateReview < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :employer
      t.references :jobhunter

      t.string :title
      t.string :description
      t.integer :rating

      t.timestamps
    end
  end
end
