require 'test_helper'

class CutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cut = cuts(:one)
  end

  test "should get index" do
    get cuts_url
    assert_response :success
  end

  test "should get new" do
    get new_cut_url
    assert_response :success
  end

  test "should create cut" do
    assert_difference('Cut.count') do
      post cuts_url, params: { cut: { order_id: @cut.order_id, program_id: @cut.program_id, x: @cut.x, y: @cut.y } }
    end

    assert_redirected_to cut_url(Cut.last)
  end

  test "should show cut" do
    get cut_url(@cut)
    assert_response :success
  end

  test "should get edit" do
    get edit_cut_url(@cut)
    assert_response :success
  end

  test "should update cut" do
    patch cut_url(@cut), params: { cut: { order_id: @cut.order_id, program_id: @cut.program_id, x: @cut.x, y: @cut.y } }
    assert_redirected_to cut_url(@cut)
  end

  test "should destroy cut" do
    assert_difference('Cut.count', -1) do
      delete cut_url(@cut)
    end

    assert_redirected_to cuts_url
  end
end
