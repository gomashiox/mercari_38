class RegistrationsController < ApplicationController
  before_action :set_group, only: [:show, :update]

  include Wicked::Wizard
  steps :confirm, :auth, :address, :card

  def show
    render_wizard
  end

  def update
    @registration.attributes = user_params
    render_wizard @registration
  end

  private

  def finish_wizard_path
    new_user_complete_path(User.find(session[:user_id]))
  end

  def user_params
    params.require(:user).permit(:nickname, :profile, :phone_number, :first_name, :last_name, :first_name_kana, :last_name_kana, :zipcode, :prefecture, :city, :address_1, :address_2)
  end

  def set_group
    @registration = User.find(session[:user_id])
  end

end
