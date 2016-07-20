class CreateChampions < ActiveRecord::Migration
  def change
    create_table :champions do |t|
    	t.integer :champ_id
    	t.string :key
    	t.string :name
    	t.string :title
      t.timestamps null: false
    end
  end
end
	