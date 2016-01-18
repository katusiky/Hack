class UsersController < ApplicationController
	before_action :set_user, except: [:index, :create]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		users = User.all
		render json: users
	end

	def show
		render json: @user
  end

	def create
		user = User.new(user_params)
		if user.save
			render json: { message: "TODO OK"}
		else
			render json: { message: "No OK"}
		end		
	end

	def update
		if @user.update(user_params)
			render json: @user
		else
			render json: { message: "NO"}
		end
	end

	def destroy
		if @user.destroy
			render json: {message: "FUERA"}
		else
			render json: {message: "blah"}
		end
	end

	private 
	def record_not_found(errors)
    render json: { error: errors.message }, status: :not_found
  end

	def set_user
		@user = User.find(params[:id])
	end
	def user_params
		params.require(:user).permit(:login, :password, :email)
	end
end
