require 'test_helper'

class ProductDetailEntriesControllerTest < ActionController::TestCase
  setup do
    @product_detail_entry = product_detail_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_detail_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_detail_entry" do
    assert_difference('ProductDetailEntry.count') do
      post :create, :product_detail_entry => @product_detail_entry.attributes
    end

    assert_redirected_to product_detail_entry_path(assigns(:product_detail_entry))
  end

  test "should show product_detail_entry" do
    get :show, :id => @product_detail_entry.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @product_detail_entry.to_param
    assert_response :success
  end

  test "should update product_detail_entry" do
    put :update, :id => @product_detail_entry.to_param, :product_detail_entry => @product_detail_entry.attributes
    assert_redirected_to product_detail_entry_path(assigns(:product_detail_entry))
  end

  test "should destroy product_detail_entry" do
    assert_difference('ProductDetailEntry.count', -1) do
      delete :destroy, :id => @product_detail_entry.to_param
    end

    assert_redirected_to product_detail_entries_path
  end
end
