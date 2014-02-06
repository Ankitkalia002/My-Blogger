class Bodycolumn < ActiveRecord::Migration
  def change
  	  reversible do |dir|
      change_table :articles do |t|
        dir.up   { t.change :body, :text }
        dir.down { t.change :body, :string }

  end
end
  end
end
