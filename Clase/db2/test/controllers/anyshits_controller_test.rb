require 'test_helper'

class AnyshitsControllerTest < ActionController::TestCase
  setup do
    @anyshit = anyshits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:anyshits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anyshit" do
    assert_difference('Anyshit.count') do
      post :create, anyshit: {  }
    end

    assert_redirected_to anyshit_path(assigns(:anyshit))
  end

  test "should show anyshit" do
    get :show, id: @anyshit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @anyshit
    assert_response :success
  end

  test "should update anyshit" do
    patch :update, id: @anyshit, anyshit: {  }
    assert_redirected_to anyshit_path(assigns(:anyshit))
  end

  test "should destroy anyshit" do
    assert_difference('Anyshit.count', -1) do
      delete :destroy, id: @anyshit
    end

    assert_redirected_to anyshits_path
  end
end
