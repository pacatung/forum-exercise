class MapsController < ApplicationController


  def index
    @maps = Map.all

  end

  def new
    @map = Map.new
  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end


end
