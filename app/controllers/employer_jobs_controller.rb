class EmployerJobsController < ApplicationController
	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		@job.company_id = current_user.company_id
		@job.save

		redirect_to employer_job_path(@job.id)
	end

	def index
		@job = Job.all.where(company_id: current_company.id).order(:created_at).reverse_order  # .page params[:page]
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

	private
	def job_params
		params.require(:job).permit(:title, :salary, :details, :location, :photos)
	end
end
