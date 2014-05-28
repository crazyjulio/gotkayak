class StaticController < ApplicationController

  def adventures
    @waterbodies = Waterbody.all
  end

  def adventure
    @waterbody = Waterbody.find_by_name(params[:name])
    unless params[:trip_name]
      @trips = @waterbody.trips.order("start_date asc")
    else
      @trip = Trip.find_by_name_and_waterbody_id(params[:trip_name],@waterbody.id)
    end
    if @trip && !@trip.nearest_water_gauge.nil?
      http = HTTPClient.new
      begin
        x = http.get "http://waterservices.usgs.gov/nwis/iv/?format=json,1.1&sites=#{@trip.nearest_water_gauge}&parameterCd=00060,00065"
        v=JSON.parse(x.body)
        site_name = v['value']['timeSeries'][0]['sourceInfo']['siteName']
        lat = v['value']['timeSeries'][0]['sourceInfo']['geoLocation']['geogLocation']['latitude']
        long = v['value']['timeSeries'][0]['sourceInfo']['geoLocation']['geogLocation']['longitude']
        variables,values = [],[]
        v['value']['timeSeries'].each do |ts|
          variables << ts['variable']['variableDescription']
          values << ts['values'][0]['value'][0]['value']
        end
        array = variables.zip(values)
        @water_gauge_info = {:latitude => lat, :longitude => long, :site_name => site_name, :var1 => array[0], :var2 => array[1]}
      rescue
      end
    end
    respond_to do |format|
      format.html # adventure.html.erb
      if @trip
        format.xml { render :xml => @trip }
      else
        format.xml { render :xml => @trips }
      end
    end
  end

  def index
    @events = Event.get_events
    @news = Event.get_news
  end

  def paypal_fun
    @color = Color.new(:description => params, :name => 'paypal_test', :manufacturer => Manufacturer.find(1))
    @color.save!
  end

  def faqs
    @faqs = Question.order(:id)
  end

  def clearance
    #Get all clearance items and group them by clearance reason, then year, then product
    @blem_items = ClearanceItem.where("clearance_reason = 'Blemish'").order(:year, :product_id)
    @closeout_items = ClearanceItem.where("clearance_reason = 'Closeout'").order(:year, :product_id)
  end
end
