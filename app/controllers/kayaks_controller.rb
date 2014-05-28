class KayaksController < ApplicationController
  def index

  end

  def manufacturers_kayaks
    @mfr = Manufacturer.find_by_name(params[:manufacturer])
    @kayaks = @mfr.kayaks
  end

  def manufacturer_kayak
    @kayak = Product.find_by_name(params[:kayak])
    @colors = @kayak.colors.order(:name)
  end
end
