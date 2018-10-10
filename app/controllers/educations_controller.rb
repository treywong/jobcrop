class EducationsController < ApplicationController

	def new
		@education = Education.new
	end

	def show
		@education = Education.find(params[:id])

	end

	def create
		@education = Education.new(education_params)
		@education.user_id = current_user.id

		if @education.save
			flash[:success] = "added education"
			redirect_to users_profile_path
		else
			flash[:error] = "cant save, try again"
			render 'new'
		end
	end

	def edit
		@education = Education.find(params[:id])
	end

	def update
		@education = Education.find(params[:id])

		if @education.update(education_params)
			flash[:success] = "updated education"
			redirect_to users_profile_path
		else
			flash[:error] = "Education not updated, try again."
			render 'edit'
		end
	end

	def destroy
		@education = Education.find(params[:id])
		@education.destroy

		redirect_to users_profile_path
	end

	private
	def education_params
		params.require(:education).permit(:institute_name,:qualification, :graduation_date, :location, :education_field, :major, :grade, :more_information)
	end

end

