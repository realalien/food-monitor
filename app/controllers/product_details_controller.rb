class ProductDetailsController < ApplicationController
  # GET /product_details
  # GET /product_details.xml
  def index
    @product_details = ProductDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_details }
    end
  end

  # GET /product_details/1
  # GET /product_details/1.xml
  def show
    @product_detail = ProductDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_detail }
    end
  end

  # GET /product_details/new
  # GET /product_details/new.xml
  def new
    @product_detail = ProductDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_detail }
    end
  end

  # GET /product_details/1/edit
  def edit
    @product_detail = ProductDetail.find(params[:id])
  end

  # POST /product_details
  # POST /product_details.xml
  def create
    @product_detail = ProductDetail.new(params[:product_detail])

    # TODO:temporary mechnism, the Product, ProductDetail relation should be based on at least two users 
    #  For now I just find and insert a relation after creating/modifying a product
    pid = Product.find_by_name(@product_detail.name)
    if pid
       logger.debug "Product Info: #{@product.inspect}"
       @product_detail[:product_id] = pid
    end 
    respond_to do |format|
      if @product_detail.save
        format.html { redirect_to(@product_detail, :notice => 'Product detail was successfully created.') }
        format.xml  { render :xml => @product_detail, :status => :created, :location => @product_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_details/1
  # PUT /product_details/1.xml
  def update
    @product_detail = ProductDetail.find(params[:id])

    respond_to do |format|
      if @product_detail.update_attributes(params[:product_detail])
        format.html { redirect_to(@product_detail, :notice => 'Product detail was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_details/1
  # DELETE /product_details/1.xml
  def destroy
    @product_detail = ProductDetail.find(params[:id])
    @product_detail.destroy

    respond_to do |format|
      format.html { redirect_to(product_details_url) }
      format.xml  { head :ok }
    end
  end
end
