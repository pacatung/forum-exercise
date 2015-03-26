#rails g controller map
class MapsController < ApplicationController


  def index
    @maps = Map.all

  end

  def new
    @map = Map.new
  end

  def create
    @map = Map.new(params.require(:map).permit(:name, :country, :time, :money, :days, :description))
    @map.save

    redirect_to maps_path, :method => :get
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

private

end
