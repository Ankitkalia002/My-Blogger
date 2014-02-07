class Adduserdata < ActiveRecord::Migration
  def change
  	add_column :users , :name, :string
  	add_column :users , :dob , :string
  	add_column :users , :address, :string
  	add_column :users , :city, :string
  	add_column :users , :gender, :string
  end
end
