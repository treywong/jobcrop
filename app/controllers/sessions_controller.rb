class SessionsController < Clearance::SessionsController
  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        flash[:success] = 'Welcome back!'
        redirect_back_or url_after_create
      else
        flash[:danger] = 'Incorrect details. Please try again!'
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def destroy
    sign_out
    redirect_to url_after_destroy
  end

  private

  def url_after_destroy
    root_url
  end

  def url_after_create
    home_index_url
  end
end
