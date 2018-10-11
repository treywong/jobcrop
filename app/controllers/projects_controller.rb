class ProjectsController < ApplicationController

	def new
		@project = Project.new
	end

	def show
		@project = Project.find(params[:id])
	end

	def create
		@project = Project.new(project_params)
		@project.user_id = current_user.id

		if @project.save
			flash[:success] = "Added project"
			redirect_to users_profile_path
		else
			flash[:error] = "can't save, try again"
			render 'new'
		end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])

		if @project.update(project_params)
			flash[:success] = "updated project"
			redirect_to users_profile_path
		else
			flash[:error] = "Project not updated, try again."
			render 'edit'
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy

		redirect_to users_profile_path
	end

	private
	def project_params
		params.require(:project).permit(
			:name,
			:description
		)
	end


end
