class ResponsesController < ApplicationController

  TWILIO="+17818195082",
  ME="+17814757398"

  def create
    @twilio.messages.create(
      from: TWILIO,
      to: ME,
      body: "#{params}"
    )
  end

  def twilio
    @_twilio ||= Twilio::REST::Client.new
  end

end
