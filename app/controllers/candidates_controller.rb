class CandidatesController < ApplicationController

  before_action :logged_in_user
  before_action :set_candidates
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]
  before_action :correct_user

  def index
    @candidates = @section.candidates
  end

  def show
  end

  def new
    @candidate = @section.candidates.build
  end

  def edit
  end

  def create
    @candidate = @section.candidates.build(candidate_params)
    @candidate.user=current_user

    if @candidate.save
      redirect_to([@candidate.section, @candidate], primary: 'Candidate was successfully created.')
    else
      render action: 'new'
    end
  end

  def update
    if @candidate.update_attributes(candidate_params)
      redirect_to([@candidate.section, @candidate], primary: 'Candidate was successfully updated.')
    else
      render action: 'edit'
    end
  end

  def destroy
    @candidate.destroy
    redirect_to (@section)
  end

  private

    def set_candidates
      @section = Section.find(params[:section_id])
    end

    def set_candidate
      @candidate = @section.candidates.find(params[:id])
    end

    def candidate_params
      params.require(:candidate).permit(:candidatename, :education, :passportsizephoto, :fathername, :mothername, :fathercontactnumber, :mothercontactnumber, :contactaddress, :previousgrademarksheet)
    end
end
