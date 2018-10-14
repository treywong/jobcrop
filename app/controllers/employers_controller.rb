class EmployersController < ApplicationController
	def index
	end

	def new
		@user = current_user
		@employer = current_user.employer
		if signed_out?
			redirect_to root_path
		end
	end

	def create
		@user = User.find(params[:user_id])
		@employer = @user.build_employer(employer_params)

		if @employer.save
			respond_to do |format|
			  format.js
			end
		else
			redirect_back(fallback_location: new_user_employer_path)
		end
	end


	def dashboard
		@employer = current_user.employer
		@company = @employer.company

		@follower = Follow.all.where(company_id: params[:id])
		@timeline = CompanyTimeline.all.where(company_id: params[:id]).last
	end

	def edit
		@company = Company.find_by(id: params[:id])
	end

	def update
		@company = Company.find_by(id: params[:id])
		@company.update(company_params)
		@company.save

		redirect_to company_page_path(@company.id)
	end

	def review_page
		@company = Company.find_by_id(params[:id])
		@review = Review.all.where(employer_id: @company.employer.id)

		# For overall rating
		total = 0
		@review.each do |r|
			total += r.rating
		end
		@overall_rating = total / @review.count
	end

	private
	def employer_params
		params.require(:employer).permit(
			:title,
			:preferences
		)
	end

	def company_params
		params.require(:company).permit(:name, :website, :telephone, :background, :location, :size, :logo)
	end

end
