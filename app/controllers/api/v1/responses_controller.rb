module Api
  module V1
    class ResponsesController < ApplicationController

      TWILIO="+17818195082",
      ME="+17814757398"

      def create
        puts params
      end

      private

      def twilio
        @_twilio ||= Twilio::REST::Client.new
      end

    end
  end
end
