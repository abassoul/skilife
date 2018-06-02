class SkiersController < ApplicationController
  def index
    @skiers = Skier.page(params[:page]).per(10)
  end

  def show
    @skier = Skier.find(params[:id])
  end
end
