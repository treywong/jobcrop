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
