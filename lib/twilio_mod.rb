module TwilioMod

  def self.send_text(app, user_phone_number)
    twilio_sid, twilio_token, twilio_phone_number = twilio_info
    twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)
    twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => "+1#{user_phone_number}",
      :body => message_body(app)
    )
  end

  def self.twilio_info
    return ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"], "6463627277"
  end

  def self.message_body(app)
    app_name = app.name.length < 20 ? app.name : app.name[0..20] + "..."
    "App: #{app_name}\n\nDownload Link: #{app.track_view_url}"
  end

end
