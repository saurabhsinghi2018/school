class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  before_action :correct_user
  # GET /sections
  # GET /sections.json
  def index
     @sections=Section.all
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    @grades=@section.grades
    @candidates=Candidate.all
    @user = User.find(current_user.id)

    if current_user.admin?
      @candidates = @section.candidates
    else
      @candidates = @section.candidates.where(user_id: current_user.id)
    end
  end

  # GET /sections/new
  def new
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
  end

  def modify

  end
  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)

      if @section.save
        redirect_to sections_path, primary: 'Section was successfully created.'
      else
         render :new
      end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    if @section.update(section_params)
     redirect_to @section, primary: 'Section was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
      redirect_to sections_url, primary: 'Section was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:section,{:grade_ids => []})
    end
end
