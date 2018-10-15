class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery unless: -> { request.format.json? }
end
