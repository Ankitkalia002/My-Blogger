class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.string :title
    	t.string :body
    	t.string :user_id
    	t.string :article_id

      t.timestamps
    end
  end
end
