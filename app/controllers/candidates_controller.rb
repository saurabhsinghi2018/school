class CandidatesController < ApplicationController

  before_action :logged_in_user
  before_action :set_candidate, only: [:show, :edit, :update]
  before_action :correct_user

  def index
    @candidates=current_user.candidates
  end

  def show
  end

  def new
    @candidate = current_user.candidates.build
  end

  def edit
  end

  def create
    @candidate = current_user.candidates.new(candidate_params)
    respond_to do |format|
      if @candidate.save
        format.html { redirect_to user_candidates_path(current_user) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        format.html { redirect_to [current_user,@candidate] }
        format.json { render :show, status: :ok, location: @candidate }
      else
        format.html { render :edit }
      end
    end
  end

  private

    def set_candidate
      @candidate = current_user.candidates.find(params[:id])
    end

    def candidate_params
      params.require(:candidate).permit(:section, :candidatename, :education, :passportsizephoto, :fathername, :mothername, :contactaddress, :fathercontactnumber, :mothercontactnumber, :previousgrademarksheet)
    end

end
