class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.references :user, index: true
    	t.string :title, null: false
    	t.string :description, null: false
    	t.string :bid

      t.timestamps null: false
    end
  end
end