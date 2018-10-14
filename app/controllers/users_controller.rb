class UsersController < Clearance::UsersController
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome #{@user.name}!"
			sign_in @user
			redirect_to home_path
		else
			flash[:danger] = "Something is wrong. #{@user.errors.full_messages.to_sentence}"
			redirect_back(fallback_location: root_path)
		end
	end

	def create_pre_employer
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome #{@user.name}!"
			sign_in @user
			redirect_to
		else
			flash[:danger] = "Something is wrong. #{@user.errors.full_messages.to_sentence}"
			redirect_back(fallback_location: root_path)
		end
	end

	# For Pre Employer Sign Up
	def new
		respond_to do |format|
		  format.js
		end
	end

	def show
		@user = User.find(params[:id])
		@experiences = @user.experiences
		@projects = @user.projects
		@languages = @user.languages
	end

	def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile successfully updated!"
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = @user.errors.full_messages.to_sentence
			respond_to do |format|
        format.js
      end
    end
  end

	def about_me
		@user = User.find(params[:user_id])
		respond_to do |format|
			format.js
		end
	end

	def edit_name
		@user = User.find(params[:user_id])
		respond_to do |format|
			format.js
		end
	end

	def edit_about_me
		@user = User.find(params[:user_id])
		respond_to do |format|
			format.js
		end
	end

	def edit_email
		@user = User.find(params[:user_id])
		respond_to do |format|
		  format.js
		end
	end

	def edit_phone
		@user = User.find(params[:user_id])
		respond_to do |format|
		  format.js
		end
	end

	def add_skill
		@user = User.find(params[:user_id])
		skills = (params[:user][:skill_list]).split(',').collect{|x| x.strip || x}
		@user.skill_list.add(skills)
		if @user.save
			@user.reload
			redirect_to @user
		end
	end

	def remove_skill
		@user = User.find(params[:user_id])
		skill = @user.skill_list[params[:id].to_i]
		@user.skill_list.remove(skill)
		if @user.save
			@user.reload
			redirect_to @user
		end
	end


	private

	def user_params
		params.require(:user).permit(
			:first_name,
			:last_name,
			:birthday,
			:email,
			:phone,
			:avatar,
			:password,
			:about_me,
			:address,
			:state,
			:zipcode,
			:country,
			:skill_list,
			:remote_avatar_url
		)
	end
end
