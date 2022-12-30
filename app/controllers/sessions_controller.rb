class SessionsController < ApplicationController
  skip_before_action :authenticate!

  def new
    flash.now.alert = warden.message if warden.message.present?
  end

  def create
    # TODO
    warden.set_user(User.first)
    redirect_to root_path
  end

  def destroy
    warden.logout
    redirect_to root_path
  end
end
