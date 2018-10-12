class EducationsController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@education = Education.where(user_id: @user.id)
		respond_to do |format|
			format.js
		end
	end

	def create
		@user = current_user
		@education = @user.educations.build(education_params)

		if @education.save
			flash[:success] = "Education Added!"
			redirect_to @user
		else
			flash[:error] = "Something Wrong. #{@education.errors.full_messages.to_sentence}"
			redirect_to @user
		end
	end

	def edit
		@user = User.find(params[:user_id])
		@education = Education.find(params[:id])
		respond_to do |format|
		  format.js
		end
	end

	def update
		@user = User.find(params[:user_id])
		@education = Education.find(params[:id])
		if @education.update(education_params)
			flash[:success] = "Education Updated"
			respond_to do |format|
			  format.js
			end
		else
			flash[:error] = "Something wrong. #{@education.errors.full_messages.to_sentence}"
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@education = Education.find(params[:id])
		@education.destroy
		redirect_back(fallback_location: @user)
	end

	private
	def education_params
		params.require(:education).permit(
			:institute,
			:qualification,
			:location,
			:major,
			:description,
			:graduation_year,
			:currently_studying
		)
	end

end
