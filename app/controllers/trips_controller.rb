class TripsController < ApplicationController
  # GET /trips/1
  # GET /trips/1.json
  def show
    @waterbody = Waterbody.find_by_name(params[:name])
    @trip = Trip.find_by_name_and_waterbody_id(params[:trip_name], @waterbody.id)
    #     if @trip && !@trip.nearest_water_gauge.empty?
    #       http = HTTPClient.new
    #       begin
    #         x = http.get "http://waterservices.usgs.gov/nwis/iv/?format=json,1.1&sites=#{@trip.nearest_water_gauge}&parameterCd=00060,00065"
    #         v = JSON.parse(x.body)
    #         site_name = v['value']['timeSeries'][0]['sourceInfo']['siteName']
    #         lat = v['value']['timeSeries'][0]['sourceInfo']['geoLocation']['geogLocation']['latitude']
    #         long = v['value']['timeSeries'][0]['sourceInfo']['geoLocation']['geogLocation']['longitude']
    #         variables = []
    #         values = []
    #         v['value']['timeSeries'].each do |ts|
    #           variables << ts['variable']['variableDescription']
    #           values << ts['values'][0]['value'][0]['value']
    #         end
    #         array = variables.zip(values)
    #         @water_gauge_info = { latitude: lat, longitude: long, site_name: site_name, var1: array[0], var2: array[1] }
    #       rescue StandardError => e
    #       end
    #     end
  end
end
