class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!, only: [:create]

  def create
    redirect_to root_path if user_signed_in?
  end

end
