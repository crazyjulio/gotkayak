class WaterbodiesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_dadmin!

  # GET /waterbodies
  # GET /waterbodies.xml
  def index
    @waterbodies = Waterbody.order(:created_at).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @waterbodies }
    end
  end

  # GET /waterbodies/1
  # GET /waterbodies/1.xml
  def show
    @waterbody = Waterbody.find(params[:id])
    @trips = @waterbody.trips

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @waterbody }
    end
  end

  # GET /waterbodies/new
  # GET /waterbodies/new.xml
  def new
    @waterbody = Waterbody.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @waterbody }
    end
  end

  # GET /waterbodies/1/edit
  def edit
    @waterbody = Waterbody.find(params[:id])
  end

  # POST /waterbodies
  # POST /waterbodies.xml
  def create
    @waterbody = Waterbody.new(params[:waterbody])

    respond_to do |format|
      if @waterbody.save
        format.html { redirect_to(@waterbody, :notice => 'Waterbody was successfully created.') }
        format.xml  { render :xml => @waterbody, :status => :created, :location => @waterbody }
      else
        flash[:alert] = t :fail, :scope => [:errors, :form]
        format.html { render :action => "new" }
        format.xml  { render :xml => @waterbody.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /waterbodies/1
  # PUT /waterbodies/1.xml
  def update
    @waterbody = Waterbody.find(params[:id])

    respond_to do |format|
      if @waterbody.update_attributes(params[:waterbody])
        format.html { redirect_to(@waterbody, :notice => 'Waterbody was successfully updated.') }
        format.xml  { head :ok }
      else
        flash[:alert] = t :fail, :scope => [:errors, :form]
        format.html { render :action => "edit" }
        format.xml  { render :xml => @waterbody.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /waterbodies/1
  # DELETE /waterbodies/1.xml
  def destroy
    @waterbody = Waterbody.find(params[:id])
    @waterbody.destroy

    respond_to do |format|
      format.html { redirect_to(waterbodies_url) }
      format.xml  { head :ok }
    end
  end
end
