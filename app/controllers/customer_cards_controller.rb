class CustomerCardsController < ApplicationController
  before_action :set_customer_card, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @customer_cards = CustomerCard.all
    respond_with(@customer_cards)
  end

  def show
    respond_with(@customer_card)
  end

  def new
    @customer_card = CustomerCard.new
    respond_with(@customer_card)
  end

  def edit
  end

  def create
    @customer_card = CustomerCard.new(customer_card_params)
    @customer_card.save
    respond_with(@customer_card)
  end

  def update
    @customer_card.update(customer_card_params)
    respond_with(@customer_card)
  end

  def destroy
    @customer_card.destroy
    respond_with(@customer_card)
  end

  private
    def set_customer_card
      @customer_card = CustomerCard.find(params[:id])
    end

    def customer_card_params
      params[:customer_card]
    end
end
