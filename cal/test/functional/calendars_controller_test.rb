require 'test_helper'

class CalendarsControllerTest < ActionController::TestCase

  setup :activate_authlogic
  
  context "a logged in user" do
    setup do
	  
	  @family1 = Fam.new(:id => 1, :title => "ich")
	  @family1.save
	  @user_params = {:id => 1, :login => "susi", :fam_id => 1, :family => "ich", :password => "test", :email => "af@aon.at", :roles => "admin" }
	  @user_1 = User.new(@user_params)
	  @user_1.save
	  UserSession.create(@user_1)
	  
	end

  context "GET to :index" do
	setup do
      get :index
	end
    should_respond_with :success
  end
  
  context "GET to: new" do
    setup do
      get :new
	end
    should_respond_with :success
  end
  
  context "create calendar" do
	should "increase Calendar.count" do
      assert_difference('Calendar.count') do
        post :create, :calendar => {:title => "test56", :description => "test56" }
      end
	  assert_redirected_to calendars_path
    end
  end
  
  context "GET to :show" do
    setup do
	  calendar_1 = Calendar.make
	  get :show, :id => calendar_1.id
	end
    should_respond_with :success
  end
  
  context "GET to :edit" do
    setup do
	  calendar_1 = Calendar.make  
      get :edit, :id => calendar_1.id
	end
    should_respond_with :success
  end
  
  context "update calendar" do
    setup do
	  calendar_1 = Calendar.make
      put :update, :id => calendar_1.id, :calendar => {:title => "test78", :description => "test78" }
	end
	should "redirect to calendar_path" do
      assert_redirected_to calendar_path
	end
  end
  
  context "destroy calendar" do
    setup do
      @calendar_1 = Calendar.make(:id => "1")
      @calendar_2 = Calendar.make(:id => "2")
	  @calendar_3 = Calendar.make(:id => "3")
	end
  
    should "decrease Calendar.count" do
      assert_difference('Calendar.count', -1) do
        delete :destroy, :id => @calendar_1.id
      end
	  assert_redirected_to calendars_path
	end
  end  
end

  context "a not logged in user" do
    setup do 
      get :index
	end
	should "be redirected to account" do
      assert_redirected_to account_url
    end
  end  

end