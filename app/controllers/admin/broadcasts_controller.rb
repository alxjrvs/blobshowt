module Admin
  class BroadcastsController < AdminController

    def new
      @broadcast = Broadcast.new
    end

    def index
      @broadcasts = Broadcast.all
    end

    def create
      if broadcast.save!
        RegisteredNumber.all.each do |rn|
          twilio.messages.create(
            from: TWILIO,
            to: rn.number,
            body: broadcast.body
          )
        end
        flash.now["notice"] = "Broadcast sent"
        redirect_to :index
      else
        flash.now["error"] = "Error occurred!"
        render :new
      end
    end

    private

    def broadcast
      Broadcast.new(broadcast_params)
    end

    def twilio
      @_twilio ||= Twilio::REST::Client.new
    end

    def broadcast_params
      params.require(:broadcast).permit(:body)
    end
  end
end
