class ConfigurationsController < ApplicationController
  before_filter :authenticate
  before_filter :load_user


  def index
    @users = User.find(:all, :conditions => ["fam_id=?", @user.fam_id])
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @configurations }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
	@hallo = @user.login
    @users = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @configuration }
    end
  end
  
  def load_user
    @user = @current_user
  end
  
   def authenticate
	unless current_user
	  redirect_to account_url
	end
  end
end
