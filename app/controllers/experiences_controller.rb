class ExperiencesController < ApplicationController

	def new
		@experience = Experience.new
	end

	def show
		@experience = Experience.find(params[:id])
	end

	def create
		@experience = Experience.new(experience_params)
		@experience.user_id = current_user.id

		if @experience.save
			flash[:success] = "Added experience"
			redirect_to users_profile_path
		else
			flash[:error] = "Can't save, try again"
			render 'new'
		end
	end

	def edit
		@experience = Experience.find(params[:id])
	end

	def update
		@experience = Experience.find(params[:id])

		if @experience.update(experience_params)
			flash[:success] = "updated experience"
		else
			flash[:error] = "Experience not updated, try again."
			render 'edit'
		end
	end

	def destroy
		@experience = Experience.find(params[:id])
		@experience.destroy

		redirect_to users_profile_path
	end

	private 
	def experience_params
		params.require(:experience).permit(:job_title, :company_name, :location, :specialization, :role, :country, :monthly_salary, :position_level, :started_at, :ended_at, :job_description)
	end
end