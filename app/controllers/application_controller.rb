class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  protect_from_forgery with: :exception

  include Pundit

  # rescue_from Error::OrderActivation, with: :order_activation_fail 

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  def success_response(message)
    render file: '/general/success_notification', locals: { message: message.squish }, head: :ok
  end

  def error_response(exception)
    message = "Something went wrong: #{exception.message}".squish
    puts message
    render file: '/general/error_notification', locals: { message: message }, head: '500'
  end

  def unexpected_response(exception)
    message = "Unexpected error: #{exception.message}".squish
    puts message
    render file: '/general/error_notification', locals: { message: message }, head: '500'
  end

  def not_authorized(exception)
    flash[:alert] = "Not authorized"
    redirect_to orders_path
  end
end
