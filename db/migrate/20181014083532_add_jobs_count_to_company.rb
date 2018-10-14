class AddJobsCountToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :jobs_count, :integer
  end
end
