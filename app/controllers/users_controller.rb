class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    if current_user
      @user = User.find(current_user.id)
      
      # ref https://github.com/joshuamiller/cartographer
      @map = Cartographer::Gmap.new( 'map' )
      @map.zoom = :bound
      @map.icons << Cartographer::Gicon.new
      
      # find user's product_details and 
      # TODO: e.g for all manufacture should have 
      # TODO: combined with knowledge of GI and cartography, device an better way to present the diagram. 
      @user.product_details.each do | pro |
        pro.product_detail_organizations.each do | org |
          logger.debug(".............   #{Geocoder.coordinates(org.orgname)}")
          if Geocoder.coordinates("#{org.orgname}").is_a?(Array) 
            marker = Cartographer::Gmarker.new(:name=> "bbc", :marker_type => "Building", :position => Geocoder.coordinates("#{org.orgname}") , :info_window_url => "/url_for_info_content")
            @map.markers << marker
            logger.debug("............. @map.markers.size   #{@map.markers.size}")
          else
            # TODO: if not get an  geo location, should allow user to add markers.
          end
        end
      end
      
      # TODO: support for friends-shared/public information, if a lot, should use delayed loading or other mechanism, like common interest.
      
      
    end  # #{org.role} : #{org.orgname}

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    if current_user
      @user = current_user 
    end
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
