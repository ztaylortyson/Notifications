class PagesController < ApplicationController
  def home
    @trackers = Tracker.all
    @tracker = Tracker.new
  end
  def add
    @cn = params[:tracker][:cn]
    puts " = = = = = > "
    tracker = Tracker.create(cn: @cn)
    if tracker.save 
      flash[:notice] = "Case Number added to Tracker."
    end
  end

  def toggle
    puts " = = = = > * * "
    @tracker = Tracker.find(params[:tracker])
    puts @tracker.active 
    if @tracker.active == true 
      @tracker.active = false
      @tracker.save
    elsif @tracker.active == false 
      @tracker.active = true
      @tracker.save
    else
      flash[:notice] = "Error."
    end
    puts " ^^ ^^ "
    puts @tracker.active
  end

end
