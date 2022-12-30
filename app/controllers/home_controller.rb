class HomeController < ApplicationController
  def index
    render text: "Welcome guest, it's #{Time.now}"
  end
end
