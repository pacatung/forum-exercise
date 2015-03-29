#rails g controller maps
class MapsController < ApplicationController

  before_action :set_map, :only => [:show, :edit, :update, :destroy]


  def index
    @maps = Map.all
    #gem kaminari
    @maps = Map.page(params[:page]).per(2)
  end

  def new
    @map = Map.new
  end

  def create
    @map = Map.new(map_params)

#    @map.save
    if @map.save
      redirect_to maps_path, :method =>:get
    else
      render :action => :new
    end

    #redirect_to maps_path, :method => :get
  end

  def show
    @page_title = @map.name
    # @map = Map.find(params[:id])

    # redirect_to :url => map_path, :method => :get
  end

  def edit
    # @map = Map.find(params[:id])
  end

  def update
    # @map = Map.find(params[:id])

    #@map.update(map_params)
    if @map.update(map_params)
      redirect_to map_path, :method =>:get
    else
      render :action => :edit
    end

    #redirect_to map_path, :method => :get
  end

  def destroy
    # @map = Map.find(params[:id])
    @map.destroy

    redirect_to maps_path, :method => :get
  end

private
  def map_params
    params.require(:map).permit(:name, :country, :time, :money, :days, :description)
  end

  def set_map
    @map = Map.find(params[:id])
  end

end