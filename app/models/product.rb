class Product < ActiveRecord::Base
	validates :title, :description, presence: true
	validates :bid, numericality:  {only_integer: true}

	belongs_to :user
end
