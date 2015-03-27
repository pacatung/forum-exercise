#rails g controller map
class MapsController < ApplicationController


  def index
    @maps = Map.all

  end

  def new
    @map = Map.new
  end

  def create
    @map = Map.new(map_params)
    @map.save

    redirect_to maps_path, :method => :get
  end

  def show
    @map = Map.find(params[:id])

    # redirect_to :url => map_path, :method => :get
  end

  def edit
    @map = Map.find(params[:id])
  end

  def update
    @map = Map.find(params[:id])
    @map.update(map_params)

    redirect_to map_path, :method => :get
  end

  def destroy
    @map = Map.find(params[:id])
    @map.destroy

    redirect_to maps_path, :method => :get
  end

private
def map_params
  params.require(:map).permit(:name, :country, :time, :money, :days, :description)
end

end
