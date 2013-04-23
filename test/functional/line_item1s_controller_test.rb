require 'test_helper'

class LineItem1sControllerTest < ActionController::TestCase
  setup do
    @line_item1 = line_item1s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_item1s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_item1" do
    assert_difference('LineItem1.count') do
      post :create, :line_item1 => { :cart_id => @line_item1.cart_id, :product_id => @line_item1.product_id }
    end

    assert_redirected_to line_item1_path(assigns(:line_item1))
  end

  test "should show line_item1" do
    get :show, :id => @line_item1
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @line_item1
    assert_response :success
  end

  test "should update line_item1" do
    put :update, :id => @line_item1, :line_item1 => { :cart_id => @line_item1.cart_id, :product_id => @line_item1.product_id }
    assert_redirected_to line_item1_path(assigns(:line_item1))
  end

  test "should destroy line_item1" do
    assert_difference('LineItem1.count', -1) do
      delete :destroy, :id => @line_item1
    end

    assert_redirected_to line_item1s_path
  end
end
