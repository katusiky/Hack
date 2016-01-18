class AnyshitsController < ApplicationController
  before_action :set_anyshit, only: [:show, :edit, :update, :destroy]

  # GET /anyshits
  # GET /anyshits.json
  def index
    @anyshits = Anyshit.all
  end

  # GET /anyshits/1
  # GET /anyshits/1.json
  def show
  end

  # GET /anyshits/new
  def new
    @anyshit = Anyshit.new
  end

  # GET /anyshits/1/edit
  def edit
  end

  # POST /anyshits
  # POST /anyshits.json
  def create
    @anyshit = Anyshit.new(anyshit_params)

    respond_to do |format|
      if @anyshit.save
        format.html { redirect_to @anyshit, notice: 'Anyshit was successfully created.' }
        format.json { render :show, status: :created, location: @anyshit }
      else
        format.html { render :new }
        format.json { render json: @anyshit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anyshits/1
  # PATCH/PUT /anyshits/1.json
  def update
    respond_to do |format|
      if @anyshit.update(anyshit_params)
        format.html { redirect_to @anyshit, notice: 'Anyshit was successfully updated.' }
        format.json { render :show, status: :ok, location: @anyshit }
      else
        format.html { render :edit }
        format.json { render json: @anyshit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anyshits/1
  # DELETE /anyshits/1.json
  def destroy
    @anyshit.destroy
    respond_to do |format|
      format.html { redirect_to anyshits_url, notice: 'Anyshit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anyshit
      @anyshit = Anyshit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anyshit_params
      params[:anyshit]
    end
end
