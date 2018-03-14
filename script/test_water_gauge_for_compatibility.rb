#!/usr/bin/env ruby

require 'httpclient'
require 'json'

http = HTTPClient.new
puts 'Enter water gauge ID:'
water_gauge_id = STDIN.gets.chomp
x = http.get "http://waterservices.usgs.gov/nwis/iv/?format=json,1.1&sites=#{water_gauge_id}&parameterCd=00060,00065"
v = JSON.parse(x.body)
site_name = v['value']['timeSeries'][0]
if site_name.nil?
  puts "Sorry, you can't use this water gauge."
else
  puts 'Huzzah! You can use this water guage.'
end
