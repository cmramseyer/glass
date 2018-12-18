require 'test_helper'

class PolishTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @polish_type = polish_types(:one)
  end

  test "should get index" do
    get polish_types_url
    assert_response :success
  end

  test "should get new" do
    get new_polish_type_url
    assert_response :success
  end

  test "should create polish_type" do
    assert_difference('PolishType.count') do
      post polish_types_url, params: { polish_type: { name: @polish_type.name } }
    end

    assert_redirected_to polish_type_url(PolishType.last)
  end

  test "should show polish_type" do
    get polish_type_url(@polish_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_polish_type_url(@polish_type)
    assert_response :success
  end

  test "should update polish_type" do
    patch polish_type_url(@polish_type), params: { polish_type: { name: @polish_type.name } }
    assert_redirected_to polish_type_url(@polish_type)
  end

  test "should destroy polish_type" do
    assert_difference('PolishType.count', -1) do
      delete polish_type_url(@polish_type)
    end

    assert_redirected_to polish_types_url
  end
end
