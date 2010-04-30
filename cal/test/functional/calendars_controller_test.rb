require 'test_helper'

class CalendarsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calendars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calendar" do
    assert_difference('Calendar.count') do
      post :create, :calendar => { }
    end

    assert_redirected_to calendar_path(assigns(:calendar))
  end

  test "should show calendar" do
    get :show, :id => calendars(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => calendars(:one).to_param
    assert_response :success
  end

  test "should update calendar" do
    put :update, :id => calendars(:one).to_param, :calendar => { }
    assert_redirected_to calendar_path(assigns(:calendar))
  end

  test "should destroy calendar" do
    assert_difference('Calendar.count', -1) do
      delete :destroy, :id => calendars(:one).to_param
    end

    assert_redirected_to calendars_path
  end
end
