class CandidatesController < ApplicationController
  before_action :set_candidates,except:[:appointment]
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]
  before_action :grade_candidates,except:[:appointment]
  before_action :logged_in_user
  before_action :correct_user
  before_action :authorize, only: [:appointment]

  # GET grades/1/candidates
  def index
    @candidate = current_user.candidate
  end

  # GET grades/1/candidates/1
  def show
    @user = @candidate.user
      correct_user
  end

  # GET grades/1/candidates/new
  def new
    @candidate = @section.candidates.new
  end

  # GET grades/1/candidates/1/edit
  def edit
  end

  # POST grades/1/candidates
  def create
    @candidate = @section.candidates.build(candidate_params)
    @candidate.user_id = current_user.id
    @user = User.find_by_id(@candidate.user_id)

    if @candidate.save
      redirect_to([@candidate.section, @candidate], primary: 'Candidate was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT grades/1/candidates/1
  def update
    if @candidate.update_attributes(candidate_params)
      if admin?
        redirect_to (edit_section_candidate_path(@candidate.section, @candidate))
      else
        redirect_to([@candidate.section, @candidate], primary: 'Candidate was successfully updated.')
      end
    else
      render action: 'edit'
    end
  end

    def destroy
      @candidate.destroy
      redirect_to [ @section], primary: 'Candidate was successfully destroyed.'
    end

    def appointment
      @candidates=Candidate.all
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidates
      @section = Section.find(params[:section_id])
    end

    def set_candidate
      # @grade = Grade.find(params[:grade_id])
      @candidate = @section.candidates.find(params[:id])
    end

    def grade_candidates
      @grades=@section.grades
    end

    # Only allow a trusted parameter "white list" through.
    def candidate_params
      params.require(:candidate).permit(:candidate_name, :education, :passport_size_photo, :father_name, :mother_name, :contact_father, :contact_mother, :contact_address, :previous_grade_marksheet,:application_status,:reason,:payment_status,:receipt,:appointment_date,:appointment_time,:appointment_place)
    end
end
