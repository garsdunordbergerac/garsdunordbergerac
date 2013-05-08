class ApplicationController < ActionController::Base
  protect_from_forgery

  if ENV['BASIC_AUTHENTICATION_USER'] && ENV['BASIC_AUTHENTICATION_PASSWORD']
    http_basic_authenticate_with name: ENV['BASIC_AUTHENTICATION_USER'], password: ENV['BASIC_AUTHENTICATION_PASSWORD']
  end
end
