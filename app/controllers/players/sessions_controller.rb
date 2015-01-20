class Players::SessionsController < Devise::SessionsController
  def new
    render layout: "sign_in"
  end

  def create
    super
  end
end