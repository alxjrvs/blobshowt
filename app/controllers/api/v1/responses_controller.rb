module Api
  module V1
    class ResponsesController < ApplicationController
      TWILIO="+17818195082",
      ME="+17814757398"

      skip_before_action :verify_authenticity_token, only: [:create]
      # {"ToCountry"=>"US", "ToState"=>"MA", "SmsMessageSid"=>"SMd3f28b8e377d77a71ffa20dfc6d01220", "NumMedia"=>"0", "ToCity"=>"ARLINGTON", "FromZip"=>"02155", "SmsSid"=>"SMd3f28b8e377d77a71ffa20dfc6d01220", "FromState"=>"MA", "SmsStatus"=>"received", "FromCity"=>"MEDFORD", "Body"=>"Test", "FromCountry"=>"US", "To"=>"+17818195082", "MessagingServiceSid"=>"MGb6b09958c646fc66e1c84ef17e4dac40", "ToZip"=>"02476", "NumSegments"=>"1", "MessageSid"=>"SMd3f28b8e377d77a71ffa20dfc6d01220", "AccountSid"=>"AC084eb5b8cf8f3644021c5b5e7058b34b", "From"=>"+17814757398", "ApiVersion"=>"2010-04-01"}

      def create
        if params["Body"].downcase == "praise the weatherlords"
          twilio.messages.create(
            from: TWILIO,
            to: params["From"],
            body: 'PRAISE THEM.'
          )
        end
        
        render nothing: true
      end

      private

      def twilio
        @_twilio ||= Twilio::REST::Client.new
      end

    end
  end
end


