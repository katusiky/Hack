class ClientsController < ApplicationController
	before_action :set_client, except: [:index, :create]
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		clients = Client.all
		#investigar sobre: jbuielder y ams
		render json: clients.as_json(only: [:name, :address, :telephone_number, :identity], include: { checks: { only: :total_amount,
                           include: { check_items: { only: [:quantity,:sub_total,:total_tax],
														include: { item: { only: [:name, :price, :tax] } } } } } })
		
	end

	def show
		render json: @client.checks
	end

	def create
		client = Client.new(client_params)
		if client.save
			render json: client
		else
			render json: client.errors
		end		
	end

	def update
		if @client.update(client_params)
			render json: @client
		else
			render json: @client.errors
		end
	end

	def destroy
		if @client.destroy
			render json: {message: "El cliente ha sido eliminado"}
		else
			render json: @client.errors
		end
	end

	private
	def record_not_found(errors)
    render json: { error: errors.message }, status: :not_found
  end

	def set_client
		@client = Client.find(params[:id])
		@client.as_json(include: :checks)
	end
	def client_params
		params.require(:client).permit(:name,:address,:telephone_number,:identity)
	end
end