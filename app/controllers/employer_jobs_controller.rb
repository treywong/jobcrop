class EmployerJobsController < ApplicationController
	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		employer_id = Employer.find_by(user_id: current_user.id).id
		@job.company_id = Company.find_by(employer_id: employer_id).id
		@job.save

		redirect_to employer_job_path(@job.id)
	end

	def index
		@company = Company.find_by_id(params[:id])
		@job = Job.all.where(company_id: params[:id]).order(:created_at).reverse_order  # .page params[:page]
	end

	def show
		@job = Job.find_by_id(params[:id])
		@company = Company.find_by(id: @job.company_id)
	end

	def edit
		@job = Job.find_by(id: params[:id])
	end

	def update
		@job = Job.find_by(id: params[:id])
		@job.update(job_params)
		@job.save

		redirect_to employer_job_path(@job.id)
	end

	def delete
		@job = Job.find_by(id: params[:id])
		company_id = @job.company_id
		@job.destroy
		redirect_to job_page_path(company_id)
	end

	private
	def job_params
		params.require(:job).permit(:title, :salary, :details, :location, :photos)
	end
end
