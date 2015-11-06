class ProductsController < ApplicationController

	def index
		@user = User.find_by(id: params[:user_id])
		@products = @user.products
	end

	def new
		@user = User.find_by(id: params[:user_id])
		@product = @user.products.new
	end

	def create

		@user = User.find_by(id: params[:user_id])
		@product = @user.products.new(entry_params)

		if @product.save
			flash["notice"] = "New product created succesfully"
			redirect_to user_products_path(@user)
		else
			flash["alert"] = @product.errors.full_messages
			redirect_to new_user_product_path(@product.user_id)
		end
	end

	def edit
		@product = Product.find_by(id: params[:id])
		@user = User.find_by(id: @product.user_id)
	end

	def update
		@product = Product.find_by(id: params[:id])
		if @product.update(entry_params)
			flash["notice"] = "Product edited successfully"
			redirect_to user_products_path(@product.user_id)
		else
			flash["alert"] = @product.errors.full_messages
			redirect_to user_product_path(@user, @product)
		end
	end

	def destroy
		product = Product.find_by(id: params[:id])
		product.destroy
		flash["notice"] = "Product succesfully removed"
		redirect_to user_products_path(product.user_id)
	end

	private
	def entry_params
		params.require(:product).permit(:title, :description)
	end
end
