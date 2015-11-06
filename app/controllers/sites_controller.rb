class SitesController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		@product = Product.find_by(id: params[:id])
		@user = User.find_by(id: @product.user_id)
	end
end
