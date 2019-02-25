class EligibilitiesController < ApplicationController

  # before_action :logged_in_user
  before_action :set_eligibility, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index]
  before_action :logged_in_user,except: [:index]

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

    if @eligibility.save
      redirect_to eligibilities_url
    else
      render :new 
    end
  end

  def update
    if @eligibility.update(eligibility_params)
     redirect_to eligibilities_path, primary: 'Eligibility was successfully updated.'
    else
      format.html { render :edit }
    end
  end

  def destroy
    @eligibility.destroy
      redirect_to eligibilities_path, primary: 'Eligibility was successfully destroyed.'
  end

  private

    def set_eligibility
      @eligibility = Eligibility.find(params[:id])
    end

    def eligibility_params
      params.require(:eligibility).permit(:section, :date_of_birth_till, :age, :date_as_on)
    end

end
