# frozen_string_literal: true

# application
class ApplicationController < ActionController::Base
  before_action :require_login

  include Clearance::Controller
end
