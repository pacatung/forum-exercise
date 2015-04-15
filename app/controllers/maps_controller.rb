#rails g controller maps
class MapsController < ApplicationController

  before_action :set_map, :only => [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def about

  end

  def index
    if params[:cid]
      category = Category.find(params[:cid])
      @maps = category.maps
    else
      @maps = Map.all
    end

    @maps = Map.page(params[:page]).per(10)
  end

  def new
    @map = Map.new
  end

  def create
    @map = Map.new(map_params)
    @map.user = current_user

    if @map.save
      flash[:notice] = "Map was successfully created."
      redirect_to maps_path
    else
      render :action => :new
    end
  end

  def show
    @page_title = @map.name


    unless cookies["view-map-#{@map.id}"]
      cookies["view-map-#{@map.id}"] = "true"
      @map.view!
    end

    @comment = Comment.new
  end

  def edit
  end

  def update
    if @map.update(map_params)
      flash[:notice] = "Map was successfully updated."
      redirect_to map_path
    else
      render :action => :edit
    end
  end

  def destroy
    @map.destroy

    flash[:alert] = "Map was successfully deleted."

    redirect_to maps_path
  end

  protected

  def map_params
    params.require(:map).permit(:name, :country, :time, :money, :days, :description, :name, :category_ids => [])
  end

  def set_map
    @map = Map.find(params[:id])
  end

end