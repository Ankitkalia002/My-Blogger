class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @customers = Customer.all
    respond_with(@customers)
  end

  def show
    respond_with(@customer)
  end

  def new
    @customer = Customer.new
    respond_with(@customer)
  end

  def edit
  end

  def create
    
   @customer = Customer.new(customer_params)
  if @customer.save_with_payment
    @customer_card=CustomerCard.new

    redirect_to @customer, :notice => "Thank you for 
      subscribing!"
  else
    render :new
  end
  end
  end

  def update
    @customer.update(customer_params)
    respond_with(@customer)
  end

  def destroy
    @customer.destroy
    respond_with(@customer)
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params

       params.require(:customer).permit(:stripe_card_token,:email)
      # params[:customer]
    end
end
