class ProductsController < ApplicationController
  layout 'admin'
  before_filter :authenticate_dadmin!
  before_filter :get_manufacturers, :only => [:new, :create, :edit, :update]
  before_filter :get_colors, :only => [:new, :create, :edit, :update]
  #before_filter :get_features, :only => [:new, :create]
  before_filter :get_manufacturers_features, :only => [:edit, :update]

  #def get_features
  #  @features = Feature.all
  #end

  def versions
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html # products.html.haml
      format.json { render :json => @product.versions }
    end
  end

  def get_manufacturers_features
    product = Product.find(params[:id])
    @features = product.manufacturer.features
  end

  def get_manufacturers
    manufacturers = Manufacturer.all
    @manufacturers = manufacturers.collect { |x| [x.name, x.id] }
  end

  def get_colors
    @colors = Color.order(:name)
  end

  # GET /products
  # GET /products.json
  def index
    @products = Product.order(:created_at).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    if params[:manufacturer_id]
      @product = Product.new(:manufacturer_id => params[:manufacturer_id])
    else
      @product = Product.new
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    params[:product][:colors] = fix_up_colors_param(params[:product][:colors])
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        flash[:alert] = t :fail, :scope => [:errors, :form]
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    params[:product][:colors] = fix_up_colors_param(params[:product][:colors])
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        flash[:alert] = t :fail, :scope => [:errors, :form]
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private

  def fix_up_colors_param(colors_param)
    colors = []
    unless colors_param.nil?
      colors_param.each do |color_id|
        colors << Color.find(color_id)
      end
    end
    colors
  end
end
