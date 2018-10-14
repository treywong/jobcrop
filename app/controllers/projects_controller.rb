class ProjectsController < ApplicationController

	def new
		@user = User.find(params[:user_id])
		@projects = @user.projects
		respond_to do |format|
		  format.js
		end
	end

	def create
		@user = User.find(params[:user_id])
		@project = @user.projects.build(project_params)
		@projects = @user.projects

		if @project.save
			flash[:success] = "Project added."
			respond_to do |format|
			  format.js
			end
		else
			flash[:error] = "Something's wrong. #{@project.errors.full_messages.to_sentence}"
			redirect_back(fallback_location: @user)
		end
	end

	def edit
		@user = User.find(params[:user_id])
		@project = Project.find(params[:id])
		respond_to do |format|
		  format.js
		end
	end

	def update
		@user = User.find(params[:user_id])
		@project = Project.find(params[:id])
		@projects = @user.projects

		if @project.update(project_params)
			flash[:success] = "Project updated"
			respond_to do |format|
			  format.js
			end
		else
			flash[:error] = "Somehing's wrong. #{@project.erros.full_messages.to_sentence}"
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@projects = @user.projects
		@project = Project.find(params[:id])
		@project.destroy
		respond_to do |format|
		  format.js
		end
	end

	private
	def project_params
		params.require(:project).permit(
			:name,
			:description
		)
	end


end
