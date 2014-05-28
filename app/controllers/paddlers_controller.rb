class PaddlersController < ApplicationController
  before_filter :authenticate_dadmin!
  layout 'admin'
  # GET /paddlers
  # GET /paddlers.xml
  def index
    @paddlers = Paddler.order(:created_at).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @paddlers }
    end
  end

  # GET /paddlers/1
  # GET /paddlers/1.xml
  def show
    @paddler = Paddler.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @paddler }
    end
  end

  # GET /paddlers/new
  # GET /paddlers/new.xml
  def new
    @paddler = Paddler.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @paddler }
    end
  end

  # GET /paddlers/1/edit
  def edit
    @paddler = Paddler.find(params[:id])
  end

  # POST /paddlers
  # POST /paddlers.xml
  def create
    @paddler = Paddler.new(params[:paddler])

    respond_to do |format|
      if @paddler.save
        format.html { redirect_to(@paddler, :notice => 'Paddler was successfully created.') }
        format.xml  { render :xml => @paddler, :status => :created, :location => @paddler }
      else
        flash[:alert] = t :fail, :scope => [:errors, :form]
        format.html { render :action => "new" }
        format.xml  { render :xml => @paddler.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /paddlers/1
  # PUT /paddlers/1.xml
  def update
    @paddler = Paddler.find(params[:id])

    respond_to do |format|
      if @paddler.update_attributes(params[:paddler])
        format.html { redirect_to(@paddler, :notice => 'Paddler was successfully updated.') }
        format.xml  { head :ok }
      else
        flash[:alert] = t :fail, :scope => [:errors, :form]
        format.html { render :action => "edit" }
        format.xml  { render :xml => @paddler.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /paddlers/1
  # DELETE /paddlers/1.xml
  def destroy
    @paddler = Paddler.find(params[:id])
    @paddler.destroy

    respond_to do |format|
      format.html { redirect_to(paddlers_url) }
      format.xml  { head :ok }
    end
  end
end
