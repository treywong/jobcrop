class SkillsController < ApplicationController

	def new
		@skill = Skill.new
	end

	def show
		@skill = Skill.find(params[:id])
		@skill = Skill.all
	end

	def create
		@skill = Skill.new(skill_params)
		@skill.user_id = current_user.id

		if @skill.save
			flash[:success] = "Added skills"
			redirect_to users_profile_path
		else
			flash[:error] = "Can't save, try again"
			render 'new'
		end
	end

	def edit
		@skill = Skill.find(params[:id])
	end

	def update
		@skill = Skill.find(params[:id])

		if @skill.update(skill_params)
			flash[:success] = "Updated skill"
		else
			flash[:error] = "Skill not updated, try again"
			render 'edit'
		end
	end

	def destroy
		@skill = Skill.find(params[:id])
		@skill.destroy
	end

	private
	def skill_params
		params.require(:skill).permit(:skill_name, :proficiency)
	end
end
