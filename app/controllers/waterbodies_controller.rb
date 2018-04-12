class WaterbodiesController < ApplicationController
  # GET /waterbodies
  # GET /waterbodies.xml
  def index
    @waterbodies = Waterbody.all
  end

  # GET /waterbodies/1
  # GET /waterbodies/1.xml
  def show
    @waterbody = Waterbody.find_by_name(params[:name])
    raise ActionController::RoutingError, 'Not Found' if @waterbody.nil?
    @trips = @waterbody.trips.order('start_date asc')
  end
end
