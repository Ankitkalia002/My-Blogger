class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :comment
    	t.string :user_id
    	t.string :article_id

      t.timestamps
    end
  end
end
