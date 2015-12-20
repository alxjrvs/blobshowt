class ResponsesController < ApplicationController

  def create
    @twilio.messages.create(
      from: '+7818195082',
      to: '+17814757398',
      body: "#{params}"
    )
  end

  def twilio
    @_twilio ||= Twilio::REST::Client.new
  end

end
