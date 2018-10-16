class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @employer = Employer.find(params[:employer_id])
    respond_to do |format|
      format.js
    end
  end

  def create
    @employer = Employer.find(params[:employer_id])
    @jobhunter = current_user.jobhunter
    @reviews = Review.where(employer_id: @employer.id).includes(:jobhunter)
    @review = @employer.reviews.build(jobhunter_id: @jobhunter.id,
                                      title: params[:review][:title],
                                      description: params[:review][:description],
                                      rating: params[:review][:rating])

    if @review.save
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = "Something's wrong. #{@review.errors.full_messages.to_sentence}"
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :title,
      :description,
      :rating
    )
  end
end
