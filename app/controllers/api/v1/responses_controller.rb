module Api
  module V1
    class ResponsesController < ApplicationController
      TWILIO="+17818195082",
      ME="+17814757398"

      skip_before_action :verify_authenticity_token, only: [:create]

      def create
        puts params
        return nil
      end

      private

      def twilio
        @_twilio ||= Twilio::REST::Client.new
      end

    end
  end
end
