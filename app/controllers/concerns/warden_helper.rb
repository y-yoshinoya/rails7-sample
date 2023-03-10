module WardenHelper
  extend ActiveSupport::Concern

  included do
    helper_method :warden, :signed_in?, :current_user

    prepend_before_action :authenticate!
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user
    warden.user
  end

  def warden
    request.env['warden']
  end

  def authenticate!
    # call AuthenticationTokenStrategy#authenticate!
    warden.authenticate!
  rescue UncaughtThrowError
    nil
  end
end
