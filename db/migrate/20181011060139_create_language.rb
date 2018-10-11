class CreateLanguage < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|
      t.references :user

      t.string :dialect
      t.integer :native
      t.integer :writing
      t.integer :speaking

      t.timestamps
    end
  end
end
