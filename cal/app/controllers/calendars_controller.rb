class CalendarsController < ApplicationController
  before_filter :authenticate
  before_filter :load_user

  # GET /calendars
  # GET /calendars.xml
  def index
    #@calendars = Calendar.all
	@calendars = @user.calendars.paginate ( :page => params[:page], :order => 'created_at ASC', :per_page => 3)
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
    @calendar = Calendar.find(params[:id])
	
	calendarWithMaxId = Calendar.find(:last, :select => "id")
	calendarMaxId = calendarWithMaxId.id
	@hashArray = Array.new()
	t = Time.now

	1.upto(calendarMaxId) do |o|
	
      events1 = Event.find(:all, :select => "title", :conditions => ["calendar_id = ?", o])
      events2 = Event.find(:all, :select => "title, description, start_on, calendar_id, id", :conditions => ["calendar_id = ?", o])

	  hashH = Hash.new() # Main Hash
	
	  if events1.empty? # calendar number ... has no events
	    @hashArray.push(hashH) # push empty Hash
	  else
	    j = 0
        loop{
	     if events2[j].start_on.nil? || events2[j].title.nil? # do not include events without a date into calendar
	       gru="ja"
		 elsif events2[j].start_on.month == t.month # include only events from the actual month into calendar
	       if hashH.has_key?(events2[j].start_on.day) # check if another event is already taking place on that date
	         hilfe = events2[j].start_on.day
	         x = hashH[hilfe]
		     y = (help.link_to events2[j].title, calendar_event_path(:calendar_id => (events2[j].calendar_id), :id => events2[j].id)) 
	         hashN = {(events2[j].start_on.day) => (x + y)} # merge events 
	       else 
		     input = events2[j].title
			 input = input.gsub( /[<>(){}\/\\]/,'')
		     hashN = {(events2[j].start_on.day) => (help.link_to input, calendar_event_path(:calendar_id => (events2[j].calendar_id), :id => events2[j].id))}
	       end
	       hashH.merge!(hashN)
		 else
	     end
	    
	     j+=1
	     break if j == events1.size
        } 
	    @hashArray.push(hashH)
	  end	 
    end

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
	@calendar = @user.calendars.build(params[:calendar])

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
