class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  before_action :correct_user
  before_action :authorize,except:[:show]


  # GET /grades
  # GET /grades.json
  def index
    @grades = Grade.all
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    @grade = Grade.new
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades
  # POST /grades.json
  def create
    @grade = Grade.new(grade_params)

    if @grade.save
       redirect_to grades_path, primary: 'Grade was successfully created.'
    else
       render :new
    end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    if @grade.update(grade_params)
      redirect_to @grade, primary: 'Grade was successfully updated.'
    else
     render :edit
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
      redirect_to grades_url, primary: 'Grade was successfully destroyed.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.



    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:grade, {:section_ids => []})
    end
end
