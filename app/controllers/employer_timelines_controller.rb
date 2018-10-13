class EmployerTimelinesController < ApplicationController
	def new
		@timeline = CompanyTimeline.new
	end

	def create
		@timeline = CompanyTimeline.new(company_timeline_params)
		employer_id = Employer.find_by(user_id: current_user.id).id
		@timeline.company_id = Company.find_by(employer_id: employer_id).id
		@timeline.save

		redirect_to employer_timeline_path(@timeline.id)
	end

	def index
		@company = Company.find_by_id(params[:id])
		@timeline = CompanyTimeline.all.where(company_id: params[:id]).order(:created_at).reverse_order  # .page params[:page]
	end

	def show
		@timeline = CompanyTimeline.find_by_id(params[:id])
		@company = Company.find_by(id: @timeline.company_id)
	end

	def edit
		@timeline = CompanyTimeline.find_by(id: params[:id])
	end

	def update
		@timeline = CompanyTimeline.find_by(id: params[:id])
		@timeline.update(company_timeline_params)
		@timeline.save

		redirect_to employer_timeline_path(@timeline.id)
	end

	def delete
		@timeline = CompanyTimeline.find_by(id: params[:id])
		company_id = @timeline.company_id
		@timeline.destroy
		redirect_to timeline_page_path(company_id)
	end

	private
	def company_timeline_params
		params.require(:company_timeline).permit(:title, :description, :photo)
	end
end
