class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		user = User.new(entry_params)
		if user.save
			flash["notice"] = "New user created succesfully"
			redirect_to users_path
		else
			flash["alert"] = user.errors.full_messages
			redirect_to new_user_path(user)
		end
	end

	def edit
		@user = User.find_by(id: params[:id])
	end

	def update
		user = User.find_by(id: params[:id])
		if user.update(entry_params)
			flash["notice"] = "User changed succesfully"
			redirect_to users_path
		else
			flash["alert"] = user.errors.full_messages
			redirect_to edit_user_path(user)
		end
	end

	def show
		@id = params[:id]
		@user = User.find_by(id: @id)
	end

	def destroy
		user = User.find_by(id: params[:id])
		user.destroy
		flash["notice"] = "User succesfully removed"
		redirect_to users_path
	end

	private
	def entry_params
		params.require(:user).permit(:name, :mail)
	end

end
