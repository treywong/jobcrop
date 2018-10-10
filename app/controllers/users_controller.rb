class UsersController < Clearance::UsersController
	
	def home
	end

	def profile
		@user = User.find_by_id(current_user.id)

		@education = Education.find_by(user_id: current_user.id)
		@education = Education.all

		@experience = Experience.find_by(user_id: current_user.id)
		@experience = Experience.all

		@skill = Skill.find_by(user_id: current_user.id)
		@skill = Skill.all

		@project = Project.find_by(user_id: current_user.id)
		@project = Project.all

	end

	


	

end