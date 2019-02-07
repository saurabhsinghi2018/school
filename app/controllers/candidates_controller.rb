class CandidatesController < ApplicationController
  before_action :set_candidates
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  before_action :correct_user
  # GET grades/1/candidates
  def index
    @candidate = current_user.candidate
    # @candidates = @grade.candidates
  end

  # GET grades/1/candidates/1
  def show
    @user = @candidate.user
      correct_user
  end

  # GET grades/1/candidates/new
  def new
    @candidate = @grade.candidates.new
  end

  # GET grades/1/candidates/1/edit
  def edit
  end

  # POST grades/1/candidates
  def create
    @candidate = @grade.candidates.build(candidate_params)
    @candidate.user_id = current_user.id
    @user = User.find_by_id(@candidate.user_id)

    if @candidate.save
      redirect_to([@candidate.grade, @candidate], primary: 'Candidate was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT grades/1/candidates/1
  def update
    if @candidate.update_attributes(candidate_params)
      if admin?
        redirect_to (edit_grade_candidate_path(@candidate.grade, @candidate))
      else
        redirect_to([@candidate.grade, @candidate], primary: 'Candidate was successfully updated.')
      end
    else
      render action: 'edit'
    end
  end

    def destroy
      @candidate.destroy
      redirect_to [ @grade]
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidates
      @grade = Grade.find(params[:grade_id])
    end

    def set_candidate
      @candidate = @grade.candidates.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def candidate_params
      params.require(:candidate).permit(:candidatename, :education, :passportsizephoto, :fathername, :mothername, :fathercontactnumber, :mothercontactnumber, :contactaddress, :previousgrademarksheet,:applicationstatus,:reason,:payment_status,:appointment_date,:appointment_time,:appointment_place)
    end
end
