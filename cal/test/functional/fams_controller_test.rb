require 'test_helper'

class FamsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fam" do
    assert_difference('Fam.count') do
      post :create, :fam => { }
    end

    assert_redirected_to fam_path(assigns(:fam))
  end

  test "should show fam" do
    get :show, :id => fams(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => fams(:one).to_param
    assert_response :success
  end

  test "should update fam" do
    put :update, :id => fams(:one).to_param, :fam => { }
    assert_redirected_to fam_path(assigns(:fam))
  end

  test "should destroy fam" do
    assert_difference('Fam.count', -1) do
      delete :destroy, :id => fams(:one).to_param
    end

    assert_redirected_to fams_path
  end
end
