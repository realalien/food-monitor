class ProductDetailEntriesController < ApplicationController
  # GET /product_detail_entries
  # GET /product_detail_entries.xml
  def index
    @product_detail_entries = ProductDetailEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_detail_entries }
    end
  end

  # GET /product_detail_entries/1
  # GET /product_detail_entries/1.xml
  def show
    @product_detail_entry = ProductDetailEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_detail_entry }
    end
  end

  # GET /product_detail_entries/new
  # GET /product_detail_entries/new.xml
  def new
    @product_detail_entry = ProductDetailEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_detail_entry }
    end
  end

  # GET /product_detail_entries/1/edit
  def edit
    @product_detail_entry = ProductDetailEntry.find(params[:id])
  end

  # POST /product_detail_entries
  # POST /product_detail_entries.xml
  def create
    @product_detail_entry = ProductDetailEntry.new(params[:product_detail_entry])

    respond_to do |format|
      if @product_detail_entry.save
        format.html { redirect_to(@product_detail_entry, :notice => 'Product detail entry was successfully created.') }
        format.xml  { render :xml => @product_detail_entry, :status => :created, :location => @product_detail_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_detail_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_detail_entries/1
  # PUT /product_detail_entries/1.xml
  def update
    @product_detail_entry = ProductDetailEntry.find(params[:id])

    respond_to do |format|
      if @product_detail_entry.update_attributes(params[:product_detail_entry])
        format.html { redirect_to(@product_detail_entry, :notice => 'Product detail entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_detail_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_detail_entries/1
  # DELETE /product_detail_entries/1.xml
  def destroy
    @product_detail_entry = ProductDetailEntry.find(params[:id])
    @product_detail_entry.destroy

    respond_to do |format|
      format.html { redirect_to(product_detail_entries_url) }
      format.xml  { head :ok }
    end
  end
end
