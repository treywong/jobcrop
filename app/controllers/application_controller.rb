class ApplicationController < ActionController::Base
  include Clearance::Controller
  before_action :require_login
  before_action :cookie_set

    def cookie_set
        @user = current_user
        return unless current_user
        cookies[:user_name] = @user.id
    end
end
