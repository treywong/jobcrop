class AddFollowersCountToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :followers_count, :integer
  end
end
