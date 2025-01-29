class RoasController < ApplicationController
  def show
  end

  def create
 
    @roa = Roa.create(lroa: params[:lroa])
    puts 
    puts " ^^ "
    puts @roa.inspect 
    puts 
  
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
