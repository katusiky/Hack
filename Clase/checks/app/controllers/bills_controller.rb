class BillsController < ApplicationController
	before_action :set_bill, except: [:index, :create]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		bills = Bill.all
		render json: bills.lastest
	end

	def show
		render json @bill
	end

	def create
		bill = Bill.new(bill_params)
		if bill.save
			render json: bill
		else
			render json: bill.errors
		end		
	end

	def update
		if @bill.update(bill_params)
			render json: @bill
		else
			render json: @bill.errors
		end
	end

	def destroy
		if @bill.destroy
			render json: {message: "La factura ha sido eliminada"}
		else
			render json: @bill.errors
		end
	end

	private
	def record_not_found(errors)
    render json: { error: errors.message }, status: :not_found
  end

	def set_bill
		@bill = Bill.find(params[:id])
	end
	def bill_params
		params.require(:bill).permit(:name,:item,:quantity,:telephone_number,:identity)
	end
end