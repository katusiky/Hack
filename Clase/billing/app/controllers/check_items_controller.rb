class CheckItemsController < ApplicationController
	before_action :set_check_item, except: [:index, :create]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		check_items = CheckItem.all
		render json: check_items
	end

	def show
		render json @check_item
	end

	def create
		check_item = CheckItem.new(check_params)
		if check_item.save
			render json: check_item
		else
			render json: check_item.errors
		end		
	end

	def update
		if @check_item.update(check_params)
			render json: @check_item
		else
			render json: @check_item.errors
		end
	end

	def destroy
		if @check_item.destroy
			render json: {message: "El cliente ha sido eliminado"}
		else
			render json: @check_item.errors
		end
	end

	private
	def record_not_found(errors)
    render json: { error: errors.message }, status: :not_found
  end

	def set_check_item
		@check_item = CheckItem.find(params[:id])
	end
	def check_params
		params.require(:check_item).permit(:name,:address,:telephone_number,:identity)
	end
end