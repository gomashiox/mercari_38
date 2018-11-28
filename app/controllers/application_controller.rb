class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :profile, :phone_number, :first_name, :last_name, :first_name_kana, :last_name_kana, :zipcode, :prefecture, :city, :address_1, :address_2, :seller_id, :buyer_id])
  end

  private

  def production?
    Rails.env.production?
  end

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
      # username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      username == "admin" && password == "2222"
    end
  end
end