class ClearanceItemsController < ApplicationController
  # GET /clearance_items
  # GET /clearance_items.json
  def index
    @blem_items = ClearanceItem.where("clearance_reason = 'Blemish'").order(:year)
    @closeout_items = ClearanceItem.where("clearance_reason = 'Closeout'").order(:year)
  end
end
