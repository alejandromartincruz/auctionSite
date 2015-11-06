class AddBidToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :bid, :integer, default: 0, null: false
  end
end
