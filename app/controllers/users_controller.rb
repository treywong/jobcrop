class UsersController < Clearance::UsersController
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = 'Welcome!'
			redirect_to root_path
		else
			flash[:danger] = 'Something is wrong'
			redirect_back(fallback_location: root_path)
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile successfully updated!"
      redirect_back(fallback_location: users_path)
    else
      flash[:danger] = @user.errors.full_messages.to_sentence
      redirect_back(fallback_location: users_path)
    end
  end

	def education
		@user = User.find(params[:user_id])
		respond_to do |format|
		  format.js
		end
	end

	def experiences
		@user = User.find(params[:user_id])
		respond_to do |format|
		  format.js
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

	def edit_detail
		@user = User.find(params[:user_id])
		respond_to do |format|
			format.js
		end
	end


	private

	def user_params
		params.require(:user).permit(
			:first_name,
			:last_name,
			:role,
			:email,
			:phone,
			:birthday,
			:password,
			:detail,
			:image,
			:checklist
		)
	end
end
