require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    check "Active" if @order.active
    fill_in "Amount", with: @order.amount
    fill_in "Comments", with: @order.comments
    fill_in "Discount", with: @order.discount
    fill_in "Fullfillment date", with: @order.fullfillment_date
    check "Gift" if @order.gift
    fill_in "Order number", with: @order.order_number
    fill_in "Quantity", with: @order.quantity
    fill_in "Rate", with: @order.rate
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    check "Active" if @order.active
    fill_in "Amount", with: @order.amount
    fill_in "Comments", with: @order.comments
    fill_in "Discount", with: @order.discount
    fill_in "Fullfillment date", with: @order.fullfillment_date
    check "Gift" if @order.gift
    fill_in "Order number", with: @order.order_number
    fill_in "Quantity", with: @order.quantity
    fill_in "Rate", with: @order.rate
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
