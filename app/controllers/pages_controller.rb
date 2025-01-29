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
    puts params.inspect
    puts " get obj"
    @obj = Tracker.find(params[:tracker])
    puts @obj.inspect
    puts "Obj's active attribute is #{@obj.active?}"
    puts 
    if @obj.active?
      @obj.active = false
      puts "Set obj active to false."
      flash[:notice] = "Status for #{@obj.cn} changed to #{@obj.active}."
      puts "Save objs active state."
      @obj.save 
      puts "done."
      puts @obj.inspect
      redirect_to root_path
    else
      @obj.active = true
      @obj.save 
      redirect_to root_path
    end
  
  end

end
