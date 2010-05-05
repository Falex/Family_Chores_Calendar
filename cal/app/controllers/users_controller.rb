class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  
  def new
    @user = User.new
  end
  
  def create

    
	#@family = Family.find(:all, :conditions => ["id=?", "1"])
	#@user = @family.users.build(params[:user])
	
	@user = User.new(params[:user])
	#@family = Family.find(:all, :conditions => ["title=?", @user.family])
	@family = Fam.find(:all, :conditions => ["title=?", @user.family])
	
	if @family.empty?
	   #@family = Family.new(:title => @user.family)
	   @family = Fam.new(:title => @user.family)
	   @family.save
	   @user.role = "admin"
	else
	   @user.role = "child"
	end
	
	@family = Fam.find(:all, :conditions => ["title=?", @user.family])
	
	#@user = @family.users.build(params[:user])
	#@family = Family.find(:all, :conditions => ["title=?", @user.family])
	
    @user.fam_id = @family[0].id 
	

	
    if @user.save
      flash[:notice] = @family[0].id #"Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
  end
 
  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
  
  def destroy 
   @user = User.find(params[:id])
   @user.destroy
   flash[:notice] = 'Account deleted!'
   redirect_to root_url
  end
  

end
