class CreateCustomerCards < ActiveRecord::Migration
  def change
    create_table :customer_cards do |t|
    	t.references :customer
    	t.text :card

      t.timestamps
    end
  end
end
