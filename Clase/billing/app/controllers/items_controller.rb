class ItemsController < ApplicationController
	before_action :set_item, except: [:index, :create]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		items = Item.all
		render json: items
	end

	def show
		render json @item
	end

	def create
		item = Item.new(check_params)
		if item.save
			render json: item
		else
			render json: item.errors
		end		
	end

	def update
		if @item.update(check_params)
			render json: @item
		else
			render json: @item.errors
		end
	end

	def destroy
		if @item.destroy
			render json: {message: "El cliente ha sido eliminado"}
		else
			render json: @item.errors
		end
	end

	private
	def record_not_found(errors)
    render json: { error: errors.message }, status: :not_found
  end

	def set_item
		@item = Item.find(params[:id])
	end
	def check_params
		params.require(:item).permit(:name,:address,:telephone_number,:identity)
	end
end