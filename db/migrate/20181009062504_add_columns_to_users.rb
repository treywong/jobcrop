class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :nationality, :string
  	add_column :users, :country, :string
  	add_column :users, :state, :string
  	add_column :users, :experience_level, :string
  	add_column :users, :expected_salary, :integer
  	add_column :users, :specialization, :string
  end
end
