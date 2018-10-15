class FollowsController < ApplicationController
  def create
    @jobhunter = current_user.jobhunter
    @company = Company.find(params[:company_id])
    @follow = @company.follows.build(jobhunter_id: @jobhunter.id)
    if @follow.save
      redirect_back(fallback_location: @company)
    else
      flash[:danger] = "Something's wrong. #{@follow.errors.full_messages.to_sentence}"
      redirect_back(fallback_location: @company)
    end
  end

  def destroy
    @follow = Follow.find_by(jobhunter_id: current_user.jobhunter.id)
    @company = Company.find(params[:company_id])
    @follow.destroy
    redirect_back(fallback_location: @company)
  end
end
