class ChecksController < ApplicationController
	before_action :set_check, except: [:index, :create]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		checks = Check.all
		render json: checks
	end

	def show
		render json: @check.items
	end

	def create
		check = Check.new(check_params)
		if check.save
			render json: check
		else
			render json: check.errors
		end		
	end

	def update
		if @check.update(check_params)
			render json: @check
		else
			render json: @check.errors
		end
	end

	def destroy
		if @check.destroy
			render json: {message: "El cliente ha sido eliminado"}
		else
			render json: @check.errors
		end
	end

	private
	def record_not_found(errors)
    render json: { error: errors.message }, status: :not_found
  end

	def set_check
		@check = Check.find(params[:id])
	end
	def check_params
		params.require(:check).permit(:name,:address,:telephone_number,:identity)
	end
end