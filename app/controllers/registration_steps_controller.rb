class RegistrationStepsController < ApplicationController
  include Wicked::Wizard
  steps :new, :confirm, :auth, :address

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.attributes = user_params
    render_wizard @user
  end

  private

  def finish_wizard_path
    users_path(current_user)
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :encrypted_password, :phone_number, :first_name, :last_name, :address)
  end
end
