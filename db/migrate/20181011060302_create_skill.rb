class CreateSkill < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.references :user

      t.string :name

      t.timestamps
    end
  end
end
