class ApplicationController < ActionController::Base
  protect_from_forgery
  # Need to explicitly include helpers to be accessable by controllers
  # Helpers are accesible to all views but not controllers
  include SessionsHelper
end
