require 'test_helper'

class ProductLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_line = product_lines(:one)
  end

  test "should get index" do
    get product_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_product_line_url
    assert_response :success
  end

  test "should create product_line" do
    assert_difference('ProductLine.count') do
      post product_lines_url, params: { product_line: { description: @product_line.description, height: @product_line.height, holes_quantity: @product_line.holes_quantity, order_id: @product_line.order_id, polish_type_id: @product_line.polish_type_id, product_id: @product_line.product_id, quantity: @product_line.quantity, tempered: @product_line.tempered, width: @product_line.width } }
    end

    assert_redirected_to product_line_url(ProductLine.last)
  end

  test "should show product_line" do
    get product_line_url(@product_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_line_url(@product_line)
    assert_response :success
  end

  test "should update product_line" do
    patch product_line_url(@product_line), params: { product_line: { description: @product_line.description, height: @product_line.height, holes_quantity: @product_line.holes_quantity, order_id: @product_line.order_id, polish_type_id: @product_line.polish_type_id, product_id: @product_line.product_id, quantity: @product_line.quantity, tempered: @product_line.tempered, width: @product_line.width } }
    assert_redirected_to product_line_url(@product_line)
  end

  test "should destroy product_line" do
    assert_difference('ProductLine.count', -1) do
      delete product_line_url(@product_line)
    end

    assert_redirected_to product_lines_url
  end
end
