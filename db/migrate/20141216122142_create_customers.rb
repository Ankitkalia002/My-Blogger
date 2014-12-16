class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
    	t.string :stripe_card_token
    	t.string :email
      t.timestamps
    end
  end
end
