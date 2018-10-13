class HomeController < ApplicationController
  before_action :require_login
  def index
  	if Employer.find_by(user_id: current_user.id)
  		@employer = Employer.find_by(user_id: current_user.id)
  		@company = Company.find_by(employer_id: @employer.id)
  	end
  end
end
