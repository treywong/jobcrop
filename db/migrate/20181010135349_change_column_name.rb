class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :experiences, :job_title, :position
    rename_column :experiences, :company_name, :company
    rename_column :experiences, :monthly_salary, :salary
    rename_column :experiences, :started_at, :start_date
    rename_column :experiences, :ended_at, :end_date
    rename_column :experiences, :job_description, :description
  end
end
