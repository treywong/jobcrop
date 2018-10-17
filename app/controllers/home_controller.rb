class HomeController < ApplicationController
  before_action :require_login
  def index
    @jobs = Job.all.includes(:company),
    @companies = Company.all.includes(:employer)
    @employers = Employer.order(jobhunters_count: :desc)

    timeline = Array.new
    timeline += [@jobs, @companies]
    @timeline = timeline.flatten.sort_by {|obj| obj.updated_at}.reverse.first(6)
    if Employer.find_by(user_id: current_user.id)
  		@employer = Employer.find_by(user_id: current_user.id)
  		@company = Company.find_by(employer_id: @employer.id)
  	end
  end

  def side
  end
end
