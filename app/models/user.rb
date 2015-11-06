class User < ActiveRecord::Base
	validates :name, :mail, uniqueness: true 
	validates :name, :mail, presence: true
	validates :name, length: {maximum: 32}

	has_many :products, dependent: :destroy
end
