class ChangeBids < ActiveRecord::Migration

  	def change
    	remove_column :products, :bid
  end

end
