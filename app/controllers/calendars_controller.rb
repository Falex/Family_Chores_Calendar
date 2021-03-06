class CalendarsController < ApplicationController
  before_filter :authenticate
  before_filter :load_user
  filter_resource_access

  # GET /calendars
  # GET /calendars.xml
  def index
    #@calendars = Calendar.all
	@login = @user.login
	@family_id = @user.fam_id
	@family = Fam.find(:all, :conditions => ["id=?", @family_id])
	@calendars = @family[0].users[0].calendars
	#@calendars = @user.calendars
	@user_session = params[:user_session]
	@count = @user.calendars.count

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @calendars }
    end
  end

  # GET /calendars/1
  # GET /calendars/1.xml
  def show
    @family_id = @user.fam_id
	@login = @user.login
	@family = Fam.find(:all, :conditions => ["id=?", @family_id])
    #@calendar = @user.calendars.find(params[:id])
	@calendar = @family[0].users[0].calendars.find(params[:id])
	#@family = @calendar.families
	#@family = Family.find(:all, :conditions => ["id=?", "1"])
	@user = User.find(:all, :conditions => ["id=?", @calendar.user_id])
	@family = User.find(:all, :conditions => ["fam_id=?", @user[0].fam_id])
	@fam = Fam.find(:all)
	#@help = @fam[0].users[0].id

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @calendar }
    end
  end

  # GET /calendars/new
  # GET /calendars/new.xml
  def new
    @calendar = Calendar.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @calendar }
    end
  end

  # GET /calendars/1/edit
  def edit
    @calendar = Calendar.find(params[:id])
  end

  # POST /calendars
  # POST /calendars.xml
  def create
    
	@family_id = @user.fam_id
	@family = Fam.find(:all, :conditions => ["id=?", @family_id])
	@calendar = @user.calendars.build(params[:calendar])
	@calendar.fam_id =  @family[0].id
	#@calendar = @family[0].calendars.build(params[:calendar])

    respond_to do |format|
      if @calendar.save
        flash[:notice] = 'Calendar was successfully created.'
        format.html { redirect_to(calendars_path) }
        format.xml  { render :xml => @calendar, :status => :created, :location => @calendar }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @calendar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /calendars/1
  # PUT /calendars/1.xml
  def update
    @calendar = Calendar.find(params[:id])

    respond_to do |format|
      if @calendar.update_attributes(params[:calendar])
        flash[:notice] = 'Calendar was successfully updated.'
        format.html { redirect_to(@calendar) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @calendar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1
  # DELETE /calendars/1.xml
  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy

    respond_to do |format|
      format.html { redirect_to(calendars_path) }
      format.xml  { head :ok }
    end
  end
  
  def authenticate
	unless current_user
	  redirect_to account_url
	end
  end
  
  def load_user
    @user = @current_user
  end
  
end
