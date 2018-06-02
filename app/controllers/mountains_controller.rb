class MountainsController < ApplicationController
  before_action :current_skier_must_be_mountain_skier, :only => [:edit, :update, :destroy]

  def current_skier_must_be_mountain_skier
    mountain = Mountain.find(params[:id])

    unless current_skier == mountain.skier
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Mountain.ransack(params[:q])
    @mountains = @q.result(:distinct => true).includes(:skier).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@mountains.where.not(:location_latitude => nil)) do |mountain, marker|
      marker.lat mountain.location_latitude
      marker.lng mountain.location_longitude
      marker.infowindow "<h5><a href='/mountains/#{mountain.id}'>#{mountain.created_at}</a></h5><small>#{mountain.location_formatted_address}</small>"
    end

    render("mountains/index.html.erb")
  end

  def show
    @mountain = Mountain.find(params[:id])

    render("mountains/show.html.erb")
  end

  def new
    @mountain = Mountain.new

    render("mountains/new.html.erb")
  end

  def create
    @mountain = Mountain.new

    @mountain.location = params[:location]
    @mountain.route_photo = params[:route_photo]
    @mountain.skier_id = params[:skier_id]
    @mountain.name = params[:name]

    save_status = @mountain.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/mountains/new", "/create_mountain"
        redirect_to("/mountains")
      else
        redirect_back(:fallback_location => "/", :notice => "Mountain created successfully.")
      end
    else
      render("mountains/new.html.erb")
    end
  end

  def edit
    @mountain = Mountain.find(params[:id])

    render("mountains/edit.html.erb")
  end

  def update
    @mountain = Mountain.find(params[:id])

    @mountain.location = params[:location]
    @mountain.route_photo = params[:route_photo]
    @mountain.skier_id = params[:skier_id]
    @mountain.name = params[:name]

    save_status = @mountain.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/mountains/#{@mountain.id}/edit", "/update_mountain"
        redirect_to("/mountains/#{@mountain.id}", :notice => "Mountain updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Mountain updated successfully.")
      end
    else
      render("mountains/edit.html.erb")
    end
  end

  def destroy
    @mountain = Mountain.find(params[:id])

    @mountain.destroy

    if URI(request.referer).path == "/mountains/#{@mountain.id}"
      redirect_to("/", :notice => "Mountain deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Mountain deleted.")
    end
  end
end
