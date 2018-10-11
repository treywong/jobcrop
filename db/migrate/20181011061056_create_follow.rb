class CreateFollow < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.references :jobhunter
      t.references :company

      t.timestamps
    end
  end
end
