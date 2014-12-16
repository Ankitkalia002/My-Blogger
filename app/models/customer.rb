class Customer < ActiveRecord::Base
	 # attr_accessible :stripe_card_token
	has_many :customer_cards
	validates_presence_of :email
  
 # attr_accessor :stripe_card_token
  
  def save_with_payment
    if valid?
    	
      customer = Stripe::Customer.create(description:email,:card => stripe_card_token)
      self.stripe_card_token = customer.id
      save!
      # customer = Stripe::Customer.retrieve(customer.id)
	  
      
    end

    rescue Stripe::InvalidRequestError => e
  logger.error "Stripe error while creating customer: #{e.message}"
  errors.add :base, "There was a problem with your credit card."
  end
  def create_card
  	customer = Stripe::Customer.retrieve(customer.id)
  	customer.cards.create(:card => stripe_card_token)
	  self.card = customer.id
      save!
  end

end
