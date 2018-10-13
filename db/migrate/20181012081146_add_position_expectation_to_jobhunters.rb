class AddPositionExpectationToJobhunters < ActiveRecord::Migration[5.2]
  def change
  	add_column :jobhunters, :position_expectation, :string
  end
end
