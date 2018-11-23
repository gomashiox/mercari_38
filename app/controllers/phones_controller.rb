class SmsAuthController < ApplicationController
  TWILIO_NUMBER = '+17275135102'  # 電話番号

  # 認証ページ（GET）
  # viewでは@sender_num, @user.sms_token, @user.idを表示
  def index
    @user = User.find(current_user.id)
    @sender_num = TWILIO_NUMBER
    @user.sms_token = generate_token
    @user.save!
  end

  # 認証処理（POST）
  def verify
    begin
      params_check;format_params;user_check;token_check;
      logger.error("valid user!")
      render :json => { code: 0 }
    rescue => e
      logger.error("error: #{e.message}")
      render :json => { code: 400, message: e.message }
      return
    end
  end

  private
  # 認証token生成
  def generate_token
    ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).sample(4).join
  end

  # パラメータチェック
  def params_check
    raise 'Body is invalid' if params[:Body].nil?
    raise "Body isn't contain underscore" if !params[:Body].include?("_")
    raise 'From is invalid' if params[:From].nil?
  end

  # パラメータ整形
  # params[:Body]は「user_id + '_' + token」の形式を想定
  def format_params
    body = params[:Body].split("_")
    @user_id = body[0]
    @token = body[1]
    @user.mobile_number = params[:From].sub(/^\+81/, '0')
    raise 'user_id is nil' if @user_id.nil?
    raise 'token is nil' if @token.nil?
    raise 'mobile_number is nil' if @user.mobile_number.nil?
  end

  # ユーザチェック
  def user_check
    @user = User.find_by_id(@user_id)
    raise 'user is invalid' if @user.nil?
  end

  # 認証トークンチェック
  def token_check
    raise 'token is invalid' if @user.sms_token == @token
    @user.verify = true
    @user.save!
  end

end
# https://qiita.com/kidach1/items/cd63063fa98aaa5030bd



def send_sms
  return status_forbidden if @phone.blank?
  @phone.assign_attributes(send_sms_params)
  ActiveRecord::Base.transaction do
    @phone.confirmation_code = @phone.generate_confirmation_code
    @phone.code_sent_at = Time.current
    @phone.save!(context: :send_sms)
    Spacemarket::Twilio.send(to: @phone.confirming_number, code: @phone.confirmation_code)
    status_updated(representer.single_default(phone))
  end
end
# 認証コードの検証
def confirm
  return status_forbidden if @phone.blank?
  return status_bad_request unless @phone.valid_code?(code: confirmation_params[:confirmation_code])
  ActiveRecord::Base.transaction do
    @phone.is_confirmed = true
    @phone.phone_number = @phone.confirming_number
    @phone.save!
    status_updated(representer.single_default(phone))
  end
end
# https://blog.spacemarket.com/code/twilio-rails-sms/