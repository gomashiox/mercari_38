# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Your Account Sid and Auth Token from twilio.com/console
account_sid = 'AC5fc7b5e4721858d0a5388b536f3ca35d'
auth_token = '661eeda03e3deefdf93c85ac59a85f64'
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages
  .create(
     body: "MERCARI_38 認証コード: #{code}",
     from: '+17275135102',
     to: '+8108035937613'
   )

puts message.sid