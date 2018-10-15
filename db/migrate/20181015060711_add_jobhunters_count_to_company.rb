class AddJobhuntersCountToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :jobhunters_count, :integer, default: 0
  end
end
