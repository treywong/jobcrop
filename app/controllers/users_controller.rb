class UsersController < Clearance::UsersController

	def home
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success]('Welcome!')
			redirect_to root_path
		else
			flash[:danger]('Something is wrong')
			redirect_back(fallback_location: root_path)
		end
	end


	private

	def user_params do
		params.require(:user).permit(
			
		)
	end
end
