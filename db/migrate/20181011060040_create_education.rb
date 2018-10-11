class CreateEducation < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.references :user

      t.string :institute
      t.string :qualification
      t.string :location
      t.string :major
      t.string :description
      t.date :graduation_year
      t.integer :currently_studying

      t.timestamps
    end
  end
end
