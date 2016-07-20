class AddGameNameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :game_name,:string
  end
end
