class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:index, :logout]

  def index
  end

  def show
  end

  def logout
  end

 private

  def set_group
    @user = current_user.id
  end

end
