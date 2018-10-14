module EmployerJobsHelper
	def current_employer
		if session[:user_id]
			Employer.find_by(user_id: session[:user_id])
		end
	end

	def current_company
		if session[:user_id]
			Company.find_by(employer_id: current_employer.id)
		end
	end
end
