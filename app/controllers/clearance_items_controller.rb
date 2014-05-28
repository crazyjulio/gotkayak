class ClearanceItemsController < ApplicationController
  layout 'admin'
  before_filter :authenticate_dadmin!
  before_filter :get_some_stuff, :only => [:new, :edit, :create, :update]

  # GET /clearance_items
  # GET /clearance_items.json
  def index
    @clearance_items = ClearanceItem.order(:created_at).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clearance_items }
    end
  end

  # GET /clearance_items/1
  # GET /clearance_items/1.json
  def show
    @clearance_item = ClearanceItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clearance_item }
    end
  end

  # GET /clearance_items/new
  # GET /clearance_items/new.json
  def new
    @clearance_item = ClearanceItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clearance_item }
    end
  end

  # GET /clearance_items/1/edit
  def edit
    @clearance_item = ClearanceItem.find(params[:id])
  end

  # POST /clearance_items
  # POST /clearance_items.json
  def create
    @clearance_item = ClearanceItem.new(params[:clearance_item])

    respond_to do |format|
      if @clearance_item.save
        format.html { redirect_to @clearance_item, notice: 'Clearance item was successfully created.' }
        format.json { render json: @clearance_item, status: :created, location: @clearance_item }
      else
        flash[:alert] = t :fail, :scope => [:errors, :form]
        format.html { render action: "new" }
        format.json { render json: @clearance_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clearance_items/1
  # PUT /clearance_items/1.json
  def update
    @clearance_item = ClearanceItem.find(params[:id])

    respond_to do |format|
      if @clearance_item.update_attributes(params[:clearance_item])
        format.html { redirect_to @clearance_item, notice: 'Clearance item was successfully updated.' }
        format.json { head :no_content }
      else
        flash[:alert] = t :fail, :scope => [:errors, :form]
        format.html { render action: "edit" }
        format.json { render json: @clearance_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clearance_items/1
  # DELETE /clearance_items/1.json
  def destroy
    @clearance_item = ClearanceItem.find(params[:id])
    @clearance_item.destroy

    respond_to do |format|
      format.html { redirect_to clearance_items_url }
      format.json { head :no_content }
    end
  end

  private

  def get_some_stuff
    products = Product.all
    @products = products.collect { |x| [x.full_name, x.id] }
    #versions = Version.all
    #@versions = versions.collect{|x| [x.name, x.id]}
    colors = Color.all
    @colors = colors.collect {|x| [x.name, x.id]}
    @clearance_reasons = ["Blemish", "Closeout"]
    @years = []
    10.times do |count|
      @years << ((Date.today + 1.year) - count.year).strftime("%Y")
    end
  end
end
