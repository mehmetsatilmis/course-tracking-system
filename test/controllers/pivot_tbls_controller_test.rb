require 'test_helper'

class PivotTblsControllerTest < ActionController::TestCase
  setup do
    @pivot_tbl = pivot_tbls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pivot_tbls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pivot_tbl" do
    assert_difference('PivotTbl.count') do
      post :create, pivot_tbl: {  }
    end

    assert_redirected_to pivot_tbl_path(assigns(:pivot_tbl))
  end

  test "should show pivot_tbl" do
    get :show, id: @pivot_tbl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pivot_tbl
    assert_response :success
  end

  test "should update pivot_tbl" do
    patch :update, id: @pivot_tbl, pivot_tbl: {  }
    assert_redirected_to pivot_tbl_path(assigns(:pivot_tbl))
  end

  test "should destroy pivot_tbl" do
    assert_difference('PivotTbl.count', -1) do
      delete :destroy, id: @pivot_tbl
    end

    assert_redirected_to pivot_tbls_path
  end
end
