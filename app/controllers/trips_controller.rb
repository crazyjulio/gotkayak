class TripsController < ApplicationController
  layout 'admin'
  before_filter :authenticate_dadmin!
  before_filter :get_waterbodies, :only => [:new, :edit, :create, :update]
  before_filter :get_paddlers, :only => [:new, :edit, :create, :update]
  before_filter :get_kayaks, :only => [:new, :edit, :create, :update]

  def get_waterbodies
    waterbodies = Waterbody.all
    @waterbodies = waterbodies.collect{|x| [x.name,x.id]}
  end

  def get_paddlers
    @paddlers = Paddler.all
    #@paddlers = paddlers.collect{|paddler| [paddler.name, paddler.id]}
  end

  def get_kayaks
    @kayaks = Product.get_kayaks
    @kayaks << OpenStruct.new(:id => 99999, :full_name => "Retired, or not-for-sale kayak")
  end

  #def paddler_kayak
  #  render :partial => 'paddler_kayak'
  #end

  # GET /trips
  # GET /trips.xml
  def index
    @trips = Trip.order(:created_at).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.xml
  def show
    @trip = Trip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.xml
  def new
    if params[:waterbody_id]
      @trip = Trip.new(:waterbody_id => params[:waterbody_id])
    else
      @trip = Trip.new
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
  end

  # POST /trips
  # POST /trips.xml
  def create
    @trip = Trip.new(params[:trip])
    @trip.paddler_kayak = params[:paddler_kayak]

    respond_to do |format|
      if @trip.save
        format.html { redirect_to(@trip, :notice => 'Trip was successfully created.') }
        format.xml  { render :xml => @trip, :status => :created, :location => @trip }
      else
        flash[:alert] = t :fail, :scope => [:errors, :form]
        format.html { render :action => "new" }
        format.xml  { render :xml => @trip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.xml
  def update
    @trip = Trip.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to(@trip, :notice => 'Trip was successfully updated.') }
        format.xml  { head :ok }
      else
        flash[:alert] = t :fail, :scope => [:errors, :form]
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.xml
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to(trips_url) }
      format.xml  { head :ok }
    end
  end
end
