class VersionsController < ApplicationController
  layout 'admin'
  before_filter :authenticate_dadmin!
  before_filter :get_manufacturers, :only => [:new, :create, :edit, :update]
  before_filter :get_manufacturers_features, :only => [:edit, :update]

  def get_manufacturers
    manufacturers = Manufacturer.all
    @manufacturers = manufacturers.collect { |x| [x.name, x.id] }
  end

  def get_manufacturers_features
    version = Version.find(params[:id])
    @features = version.manufacturer.features
  end

  # GET /versions
  # GET /versions.xml
  def index
    @versions = Version.order(:created_at).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @versions }
    end
  end

  # GET /versions/1
  # GET /versions/1.xml
  def show
    @version = Version.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @version }
    end
  end

  # GET /versions/new
  # GET /versions/new.xml
  def new
    if params[:product_id] && params[:manufacturer_id]
      @features = Manufacturer.find(params[:manufacturer_id]).features
      @version = Version.new(:product_id => params[:product_id], :manufacturer_id => params[:manufacturer_id])
    else
      @version = Version.new
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @version }
    end
  end

  # GET /versions/1/edit
  def edit
    @version = Version.find(params[:id])
  end

  # POST /versions
  # POST /versions.xml
  def create
    params[:version][:features] = fix_up_features_param(params[:version][:features])
    @version = Version.new(params[:version])

    respond_to do |format|
      if @version.save
        format.html { redirect_to(@version, :notice => 'Version was successfully created.') }
        format.xml  { render :xml => @version, :status => :created, :location => @version }
      else
        flash[:alert] = t :fail, :scope => [:errors, :form]
        format.html { render :action => "new" }
        format.xml  { render :xml => @version.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /versions/1
  # PUT /versions/1.xml
  def update
    params[:version][:features] = fix_up_features_param(params[:version][:features])
    @version = Version.find(params[:id])

    respond_to do |format|
      if @version.update_attributes(params[:version])
        format.html { redirect_to(@version, :notice => 'Version was successfully updated.') }
        format.xml  { head :ok }
      else
        flash[:alert] = t :fail, :scope => [:errors, :form]
        format.html { render :action => "edit" }
        format.xml  { render :xml => @version.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /versions/1
  # DELETE /versions/1.xml
  def destroy
    @version = Version.find(params[:id])
    @version.destroy

    respond_to do |format|
      format.html { redirect_to(versions_url) }
      format.xml  { head :ok }
    end
  end

  private

  def fix_up_features_param(features_param)
    features = []
    unless features_param.nil?
      features_param.each do |feature_id|
        features << Feature.find(feature_id)
      end
    end
    features
  end
end
