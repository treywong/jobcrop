class CompaniesController < ApplicationController
	def index
		if current_user.employer
			@employer = current_user.employer
			@company = @employer.company
		else
			redirect_to employer_index_path
		end
	end
	def new
		@employer = current_user.employer
	end

	def create
		@employer = current_user.employer
		@company = @employer.build_company(company_params)
		if @company.save
			redirect_to root_path
		else
			flash[:danger] = @company.errors.full_messages.to_sentence
			redirect_back(fallback_location: root_path)
		end
	end

	def show
		@company = Company.find(params[:id])
	end

	private

	def company_params
		params.require(:company).permit(:name, :website, :telephone, :background, :location, :size, :logo)
	end
end
