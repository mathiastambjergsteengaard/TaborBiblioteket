class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  require "browser"
  before_action :browser
  def browser
    @browser = Browser.new(request.user_agent)
  end

  def mobile?
    request.headers['X_MOBILE_DEVICE']
  end
end
