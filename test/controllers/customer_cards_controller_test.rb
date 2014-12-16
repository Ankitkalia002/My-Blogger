require 'test_helper'

class CustomerCardsControllerTest < ActionController::TestCase
  setup do
    @customer_card = customer_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_card" do
    assert_difference('CustomerCard.count') do
      post :create, customer_card: {  }
    end

    assert_redirected_to customer_card_path(assigns(:customer_card))
  end

  test "should show customer_card" do
    get :show, id: @customer_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_card
    assert_response :success
  end

  test "should update customer_card" do
    patch :update, id: @customer_card, customer_card: {  }
    assert_redirected_to customer_card_path(assigns(:customer_card))
  end

  test "should destroy customer_card" do
    assert_difference('CustomerCard.count', -1) do
      delete :destroy, id: @customer_card
    end

    assert_redirected_to customer_cards_path
  end
end
