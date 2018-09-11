class ApplicationController < ActionController::Base
  include SendGrid

  layout 'application'

end
