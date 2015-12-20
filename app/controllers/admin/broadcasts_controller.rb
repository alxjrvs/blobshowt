class BroadcastsController < AdminController

  def new
    @broadcast = Broadcast.new
  end

  def index
    @broadcasts = Broadcast.all
  end

  def create
  end

  private

end
