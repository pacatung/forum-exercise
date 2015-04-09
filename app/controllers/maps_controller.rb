#rails g controller maps
class MapsController < ApplicationController

  before_action :set_map, :only => [:show, :edit, :update, :destroy]

  def index
    @maps = Map.page(params[:page]).per(2)
  end

  def new
    @map = Map.new
  end

  def create
    @map = Map.new(map_params)

    if @map.save
      flash[:notice] = "Map was successfully created"
      redirect_to maps_path
    else
      render :action => :new
    end
  end

  def show
    @page_title = @map.name
  end

  def edit
  end

  def update
    if @map.update(map_params)
      flash[:notice] = "Map was successfully updated"
      redirect_to map_path
    else
      render :action => :edit
    end
  end

  def destroy
    @map.destroy

    flash[:alert] = "Map was successfully deleted"

    redirect_to maps_path
  end

  private

  def map_params
    params.require(:map).permit(:name, :country, :time, :money, :days, :description)
  end

  def set_map
    @map = Map.find(params[:id])
  end

end