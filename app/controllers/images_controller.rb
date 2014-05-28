class ImagesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_dadmin!
  before_filter :get_models, :only => [:new, :edit, :create, :update]

  def models
    #Take the model that is passed in as an ID, constantize it, and then I can look up records with it
    @records = params[:id].constantize.find :all
    @records.each do |record|
      #Doing this to get "#{manufacturer.name} #{product.name}" for products
      record.name = record.full_name if record.respond_to?(:full_name)
    end
    respond_to do |format|
      format.json { render :json => @records }
    end
  end

  # GET /images
  # GET /images.xml
  def index
    @images = Image.order(:created_at).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @images }
    end
  end

  # GET /images/1
  # GET /images/1.xml
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @image }
    end
  end

  # GET /images/new
  # GET /images/new.xml
  def new
    if params[:model] && params[:model_id]
      @image = Image.new(:model => params[:model], :model_id => params[:model_id])
      get_records(@image)
    else
      @image = Image.new
      @records = []
    end

    respond_to { |format|
      format.html # new.html.erb
      format.xml { render :xml => @image }
    }
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
    get_records(@image)
  end

  # POST /images
  # POST /images.xml
  def create
    @image = Image.new(params[:image])
    respond_to do |format|
      if @image.save
        format.html { redirect_to(@image, :notice => 'Image was successfully created.') }
        format.xml  { render :xml => @image, :status => :created, :location => @image }
      else
        flash[:alert] = t :fail, :scope => [:errors, :form]
        get_records(@image)
        format.html { render :action => "new" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.xml
  def update
    @image = Image.find(params[:id])
    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to(@image, :notice => 'Image was successfully updated.') }
        format.xml  { head :ok }
      else
        flash[:alert] = t :fail, :scope => [:errors, :form]
        get_records(@image)
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.xml
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to(images_url) }
      format.xml  { head :ok }
    end
  end

  private

  def get_models
    @models = ['Paddler', 'Product', 'Trip', 'Event', 'Waterbody']
  end

  def get_records(image)
    unless image.model.blank?
      @records = image.model.constantize.find :all
      @records.each do |record|
        #Doing this to get "#{manufacturer.name} #{product.name}" for products
        record.name = record.full_name if record.respond_to?(:full_name)
      end
    else
      @records = []
    end
  end
end
