class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.string :institute_name
      t.string :qualification
      t.date :graduation_date
      t.string :location
      t.string :education_field
      t.string :major
      t.string :grade
      t.text :more_information

      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
