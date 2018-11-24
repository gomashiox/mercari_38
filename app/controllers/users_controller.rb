class UsersController < ApplicationController
  # include Wicked::Wizard
  # steps :new, :confirm, :auth, :address

#   def show
#     # @user = current_user
#     # case step
#     # when :find_friends
#     #   @friends = @user.find_friends
#     # end
#     render_wizard
#   end
# end

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.attributes = user_params
    render_wizard @user
  end

def create
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect_to user_steps_path
  else
    render :new
  end
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




  # def index
  # end

  # def show

  # end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     session[:user_id] = @user.id
  #     redirect_to user_steps_path
  #   else
  #     render :new
  #   end
  # end
