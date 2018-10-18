class BookingsController < ApplicationController
  def index
    @company = Company.find(current_user.employer.company.id)
    @jobs = Job.includes(:bookings).where(company_id: @company.id)
  end

  def create
    if current_user.profile_complete?
      @company = Company.find(params[:company_id])
      @job = Job.find(params[:job_id])
      @jobhunter = Jobhunter.find_by(user_id: current_user.id)
      @booking = Booking.new(
        job_id: @job.id,
        jobhunter_id: @jobhunter.id,
        session: params[:booking][:session],
        files: params[:booking][:files],
        details: params[:booking][:details]
      )
      if @booking.save
        respond_to do |format|
          format.js
        end
      else
        flash[:danger] = "Something's wrong. #{@booking.errors.full_messages.to_sentence}"
      end
    else
      flash[:warning] = "Please complete profile before applying for any job."
      redirect_to user_path(current_user.id)
    end
  end

  def show
  end

  private

  def booking_params
    params.require(:booking).permit(
      :session,
      :files,
      :details
    )
  end
end
