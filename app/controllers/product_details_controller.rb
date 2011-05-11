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
    
    
    # -----------   DEMO of cartographer plugin ------------
    # ref. https://github.com/joshuamiller/cartographer
    @map = Cartographer::Gmap.new( 'map' )
    @map.zoom = :bound
    @map.icons << Cartographer::Gicon.new
    marker1 = Cartographer::Gmarker.new(:name=> "taj_mahal", :marker_type => "Building",
                :position => [27.173006,78.042086],
                :info_window_url => "/url_for_info_content")
    marker2 = Cartographer::Gmarker.new(:name=> "raj_bhawan", :marker_type => "Building",
                :position => [28.614309,77.201353],
                :info_window_url => "/url_for_info_content")
    @map.markers << marker1
    @map.markers << marker2
    # -------------------------------------------------------
    
    # try to edit product's organizations in product show ?
    # Q: is it normal way for editing? what's better way?
    # Q: 
    @product_detail.product_detail_organizations.build.build_organization
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_detail }
    end
  end

  # GET /product_details/new
  # GET /product_details/new.xml
  def new
    @product_detail = ProductDetail.new
    
    # support for user contribute organization role and name
    1.times do 
      @product_detail.product_detail_organizations.build
    end
    
    # support for user contribute key/value pair entries
    3.times do 
      @product_detail.product_detail_entries.build
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_detail }
    end
  end

  # GET /product_details/1/edit
  def edit
    @product_detail = ProductDetail.find(params[:id])
    
    
    # support for role organizations
    @product_detail_organizations = @product_detail.product_detail_organizations
    
    # support for multiple entries of user contributed key/value pairs 
    @product_detail_entries = @product_detail.product_detail_entries
    
    # construct two new entries for adding
    1.times { @product_detail.product_detail_organizations.build }
    2.times { @product_detail.product_detail_entries.build } 
  end

  # POST /product_details
  # POST /product_details.xml
  def create
    @product_detail = ProductDetail.new(params[:product_detail])
    
    # TODO: save user_id to entries if user logged in, anonymous user will assigned to zero.
    # TODO: RESEARCH: how to handle user remove entry(just set removed flag if no same name attribute as user delete unintentonally, really delete one if has same name attribute, Q: what's the use of history of attribute even delete? )
    # todo: for table 'product_detail_organization', 'product_detail_entries', etc


    # TODO:temporary mechnism, the Product, ProductDetail relation should be based on at least two users 
    #  For now I just find and insert a relation after creating/modifying a product
    pid = Product.find_by_name(@product_detail.name)
    if pid
       logger.debug "Product Info: #{@product.inspect}"
       @product_detail[:product_id] = pid
    end 
    
    # support for user based entries
    if current_user
      @product_detail.user = current_user
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
  
  
  # sandbox of bulk update of 
  # ref. http://stackoverflow.com/questions/5368947/rails-updating-multiple-nested-attributes-restfully
  def bulk_update
    if current_user
      @user = User.find(current_user.id)  # TODO: is it necessary to find user? 
      @product_details = @user.product_details 
    end
  end
  
end
