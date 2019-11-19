# frozen_string_literal: true

# ExceptionHandler module to Handle errors globally
# include ExceptionHandler in application_controller.rb

module ExceptionHandler
  # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end
  class AccessDenied < StandardError; end
  class UnavailableMethodError < StandardError; end
  class NotImplementedMethodError < StandardError; end
  class InvalidArgumentError < StandardError; end

  def self.included(including_class)
    including_class.class_eval do
      # ActiveRecord Handlers
      rescue_from ActiveRecord::RecordInvalid, with: :four_two_two
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

      # Custom handlers
      rescue_from ExceptionHandler::InvalidArgumentError, with: :four_two_two
      rescue_from ExceptionHandler::AuthenticationError, with: :generic_unauthorized
      rescue_from ExceptionHandler::AccessDenied, with: :access_denied
      rescue_from ExceptionHandler::UnavailableMethodError, with: :unavailable_method
      rescue_from ExceptionHandler::NotImplementedMethodError, with: :not_implemented_method
    end
  end

  private

  # JSON response with message; Status code 404 - Not found
  def record_not_found(raised_exception)
    render json: {error: raised_exception.message}, status: :not_found
  end

  # JSON response with message; Status code 401 - Unauthorized
  def access_denied(raised_exception)
    render json: {error: raised_exception.message}, status: :forbidden
  end

  # JSON response with message; Status code 501 - Server error
  def server_error(raised_exception)
    render json: {error: raised_exception.message}, status: 501
  end

  # JSON response with message; Status code 422 - unprocessable entity
  def four_two_two(raised_exception)
    render json: {error: raised_exception.message}, status: :unprocessable_entity
  end

  # JSON response with message; Status code 404 - Not available
  def unavailable_method
    render json: {error: "Method is unavailable."}, status: 404
  end

  # JSON response with message; Status code 400 - Not implemented
  def not_implemented_method
    render json: {error: "Method is not implemented."}, status: 400
  end

  # JSON response with message; Status code 401 - Unauthorized
  def generic_unauthorized(raised_exception)
    render json: {error: raised_exception.message}, status: :unauthorized
  end
end
