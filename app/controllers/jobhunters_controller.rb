class JobhuntersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @jobhunter = @user.jobhunter
    respond_to do |format|
      format.js
    end
  end

  def new
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @user = User.find(params[:user_id])
    @jobhunter = @user.build_jobhunter(jobhunter_params)
    if @jobhunter.save
      flash[:success] = "Preferences created."
      redirect_to root_path
      respond_to do |format|
        format.html
        format.js
      end
    else
      flash[:danger] = "Something's wrong. #{@jobhunter.errors.full_messages.to_sentence}"
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @jobhunter = @user.jobhunter
    respond_to do |format|
      format.js
    end
  end

  def update
    @user = User.find(params[:user_id])
    @jobhunter = @user.jobhunter
    if @jobhunter.update(jobhunter_params)
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = "Something's wrong. #{@jobhunter.errors.full_messages.to_sentence}"
    end
  end

  private

  def jobhunter_params
    params.require(:jobhunter).permit(
      :preferences,
      :position_expectation,
      :salary_expectation,
      :title_expectation
    )
  end
end
