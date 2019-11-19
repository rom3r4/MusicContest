# frozen_string_literal: true

require "application_responder"

class ApplicationController < ActionController::API
  self.responder = ApplicationResponder

  include ExceptionHandler
end
