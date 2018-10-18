class FollowsController < ApplicationController
  def create
    if current_user.profile_complete?
      @jobhunter = current_user.jobhunter
      @company = Company.find(params[:company_id])
      @follow = @company.follows.build(jobhunter_id: @jobhunter.id)
      if @follow.save
        redirect_back(fallback_location: @company)
      else
        flash[:danger] = "Something's wrong. #{@follow.errors.full_messages.to_sentence}"
        redirect_back(fallback_location: @company)
      end
    else
      flash[:warning] = "Please complete profile before applying for any job."
      redirect_to user_path(current_user.id)
    end
  end

  def destroy
    @follow = Follow.find_by(jobhunter_id: current_user.jobhunter.id)
    @company = Company.find(params[:company_id])
    @follow.destroy
    redirect_back(fallback_location: @company)
  end
end
