module Api
  module V1
    class ResponsesController < ApplicationController
      TWILIO="+17818195082"
      ME="+17814757398"

      skip_before_action :verify_authenticity_token, only: [:create]

      def create
        if admin?
          send_blast
        else
          if !registered?
            if subscription_keyphrase_match? 
              RegisteredNumber.create(number: from)
              send_welcome_message
            end
          end
        end

        render nothing: true
      end

      private

      def admin?
        from == ME
      end

      def send_blast
        RegisteredNumber.all.each do |rn|
          twilio.messages.create(
            from: TWILIO,
            to: rn.number,
            body: body
          )
        end
      end

      def send_welcome_message
        twilio.messages.create(
          from: TWILIO,
          to: from,
          body: 'PRAISE THEM. YOU ARE IN THE FOLD.'
        )
      end

      def send_help_message
        twilio.messages.create(
          from: TWILIO,
          to: from,
          body: 'TO STOP RECEIVING MESSAGES FROM THE WEATHER LORDS, REPLY WITH STOP'
        )
      end

      def send_removal_message
        twilio.messages.create(
          from: TWILIO,
          to: from,
          body: 'YOU HAVE BEEN REMOVED.'
        )
      end

      def body
        params["Body"]
      end

      def from
        params["From"]
      end

      def remove_keyphrase_match?
        body == "STOP"
      end

      def help_keyphrase_match?
        body == "HELP"
      end

      def subscription_keyphrase_match?
        body == "PRAISE THE WEATHERLORDS"
      end

      def registered?
        RegisteredNumber.where(number: from).any?
      end

      def twilio
        @_twilio ||= Twilio::REST::Client.new
      end
    end
  end
end
