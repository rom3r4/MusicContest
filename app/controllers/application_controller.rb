require "application_responder"

class ApplicationController < ActionController::API
  self.responder = ApplicationResponder

  include ExceptionHandler

  respond_to :json
end
