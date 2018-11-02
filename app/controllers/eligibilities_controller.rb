class EligibilitiesController < ApplicationController

  before_action :logged_in_user
  before_action :set_eligibility, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index]

  def index
    @eligibilities = Eligibility.all
  end

  def show
  end

  def new
    @eligibility = Eligibility.new
  end

  def edit
  end

  def create
    @eligibility = Eligibility.new(eligibility_params)

    respond_to do |format|
      if @eligibility.save
        format.html { redirect_to eligibilities_url }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @eligibility.update(eligibility_params)
        format.html { redirect_to @eligibility }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @eligibility.destroy
    respond_to do |format|
      format.html { redirect_to eligibilities_url }
      format.json { head :no_content }
    end
  end

  private

    def set_eligibility
      @eligibility = Eligibility.find(params[:id])
    end

    def eligibility_params
      params.require(:eligibility).permit(:section, :dateofbirthtill, :age, :dateason)
    end

end
