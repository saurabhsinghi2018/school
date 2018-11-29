class SectionsController < ApplicationController

  before_action :logged_in_user
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  before_action :correct_user

  def index
    @sections = current_user.sections
  end

  def show
  end

  def new
    @section=Section.new
  end

  def edit
  end

  def create
    @section = Section.new(section_params)
    @section.user = current_user

    respond_to do |format|
      if @section.save
        format.html { redirect_to sections_url, primary: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @section, primary: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, primary: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:section,candidates_attributes: [:id,:candidatename,:education,:passportsizephoto,:fathername,:mothername,:fathercontactnumber,:mothercontactnumber,:contactaddress,:previousgrademarksheet])
    end
end
