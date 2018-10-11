class ExperiencesController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@experiences = Experience.where(user_id: @user.id)
		respond_to do |format|
		  format.js
		end
	end

	def create
		@user = current_user
		@experience = @user.experiences.build(experience_params)

		if @experience.save
			flash[:success] = "Experience added!"
			redirect_back(fallback_location: @user)
		else
			flash[:error] = "Something wrong. #{@experience.errors.full_messages.to_sentence}"
			redirect_back(fallback_location: @user)
		end
	end

	def edit
		@user = User.find(params[:user_id])
		@experience = Experience.find(params[:id])
		respond_to do |format|
		  format.js
		end
	end

	def update
		@user = User.find(params[:user_id])
		@experience = Experience.find(params[:id])
		if @experience.update(experience_params)
			flash[:success] = "Experience Updated"
			respond_to do |format|
			  format.js
			end
		else
			flash[:error] = "Something wrong. #{@experience.errors.full_messages.to_sentence}"
		end
	end

	def destroy
		@experience = Experience.find(params[:id])
		@experience.destroy
		respond_to do |format|
			format.js
		end
	end

	private
	def experience_params
		params.require(:experience).permit(
			:title,
			:company,
			:location,
			:salary,
			:start_date,
			:end_date,
			:description,
			:currently_working
		)
	end
end
