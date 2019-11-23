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
  class ContestNotFound < StandardError; end
  class ParticipantNotFound < StandardError; end
  class SongNotFound < StandardError; end
  class SongWasAlreadySubmitted < StandardError; end
  class MaximumSongsSubmitted < StandardError; end
  class ParticipantCannotDelete < StandardError; end
  class SpotifyAPIError < StandardError; end
  class SpotifyURIParsingError < StandardError; end

  def self.included(including_class)
    including_class.class_eval do
      # ActiveRecord Handlers
      rescue_from ActiveRecord::RecordInvalid, with: :four_two_two
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

      # Custom handlers
      rescue_from ExceptionHandler::InvalidArgumentError, with: :four_two_two
      rescue_from ExceptionHandler::AccessDenied, with: :access_denied
      rescue_from ExceptionHandler::UnavailableMethodError, with: :unavailable_method
      rescue_from ExceptionHandler::NotImplementedMethodError, with: :not_implemented_method
      rescue_from ExceptionHandler::ContestNotFound, with: :contest_not_found
      rescue_from ExceptionHandler::ParticipantNotFound, with: :participant_not_found
      rescue_from ExceptionHandler::SongNotFound, with: :song_not_found
      rescue_from ExceptionHandler::SongWasAlreadySubmitted, with: :song_was_already_sumbitted
      rescue_from ExceptionHandler::MaximumSongsSubmitted, with: :maximum_songs_submitted
      rescue_from ExceptionHandler::ParticipantCannotDelete, with: :participant_cannot_delete
      rescue_from ExceptionHandler::SpotifyAPIError, with: :spotify_error
      rescue_from ExceptionHandler::SpotifyURIParsingError, with: :spotify_uri_parsing_error
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

  # Custon Application Exceptions Status codes 440 - 499

  def contest_not_found(raised_exception)
    render json: {error: raised_exception.message}, status: 448
  end

  def participant_not_found(raised_exception)
    render json: {error: raised_exception.message}, status: 449
  end

  def song_not_found(raised_exception)
    render json: {error: raised_exception.message}, status: 450
  end

  def song_was_already_sumbitted(raised_exception)
    render json: {error: raised_exception.message}, status: 451
  end

  def maximum_songs_submitted(raised_exception)
    render json: {error: raised_exception.message}, status: 452
  end

  def participant_cannot_delete(raised_exception)
    render json: {error: raised_exception.message}, status: 453
  end

  def spotify_error(raised_exception)
    render json: {error: raised_exception.message}, status: 454
  end

  def spotify_uri_parsing_error(raised_exception)
    render json: {error: raised_exception.message}, status: 455
  end
end
