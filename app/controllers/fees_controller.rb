class FeesController < ApplicationController
  before_action :set_fee, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  before_action :authorize,except:[:index]


  # GET /fees
  # GET /fees.json
  def index
    @fees = Fee.all
  end

  # GET /fees/1
  # GET /fees/1.json
  def show
  end

  # GET /fees/new
  def new
    @fee = Fee.new
  end

  # GET /fees/1/edit
  def edit
  end

  # POST /fees
  # POST /fees.json
  def create
    @fee = Fee.new(fee_params)

    if @fee.save
     redirect_to fees_path, primary: 'Fee was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /fees/1
  # PATCH/PUT /fees/1.json
  def update
    if @fee.update(fee_params)
       redirect_to fees_path, primary: 'Fee was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /fees/1
  # DELETE /fees/1.json
  def destroy
    @fee.destroy
      redirect_to fees_path, primary: 'Fee was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fee
      @fee = Fee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fee_params
      params.require(:fee).permit(:klass, :fee)
    end
end
