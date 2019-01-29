class GradesController < ApplicationController
  before_action :set_grades
  before_action :set_grade, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  before_action :correct_user

  # GET sections/1/grades
  def index
    @grades = @section.grades
  end

  # GET sections/1/grades/1
  def show
    @user = User.find(current_user.id)
    if current_user.admin?
      @candidates = @grade.candidates
    else
      @candidates = @grade.candidates.where(user_id: current_user.id)
    end
  end

  # GET sections/1/grades/new
  def new
    @grade = @section.grades.build
  end

  # GET sections/1/grades/1/edit
  def edit
  end

  # POST sections/1/grades
  def create
    @grade = @section.grades.build(grade_params)

    if @grade.save
      redirect_to(section_grades_path(@grade.section), primary: 'Grade was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT sections/1/grades/1
  def update
    if @grade.update_attributes(grade_params)
      redirect_to([@grade.section, @grade], primary: 'Grade was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE sections/1/grades/1
  def destroy
    @grade.destroy

    redirect_to section_grades_url(@section)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grades
      @section = Section.find(params[:section_id])
    end

    def set_grade
      @grade = @section.grades.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def grade_params
      params.require(:grade).permit(:grade)
    end
end
