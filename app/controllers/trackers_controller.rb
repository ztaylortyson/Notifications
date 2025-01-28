class TrackersController < ApplicationController
  def index
    @trackers = Tracker.all
  end

  def create
  end

  def edit
    @tracker = Tracker.find(params[:tracker])
  end

  def update
    puts params.inspect
  end

  def destroy
    @tracker = Tracker.find(params[:tracker])
    if @tracker.destroy
      flash[:notice] = "Case Tracker successfully destroyed."
    end
    redirect_to root_path
  end
end
