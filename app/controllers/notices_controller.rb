class NoticesController < ApplicationController

  before_action :logged_in_user,except: [:index]
  before_action :set_notice, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index]

  def index
    @notices = Notice.all
  end

  def show
  end


  def new
    @notice = Notice.new
  end

  def edit
  end

  def create
    @notice = Notice.new(notice_params)

    if @notice.save
       redirect_to notices_path
    else
       render :new
    end
  end

  def update
    if @notice.update(notice_params)
      redirect_to notices_path, primary: 'Notice was successfully updated.'
    else
      render :edit
      end
  end

  def destroy
    @notice.destroy
     redirect_to notices_url, primary: 'Notice was successfully destroyed.'
  end

  private

    def set_notice
      @notice = Notice.find(params[:id])
    end

    def notice_params
      params.require(:notice).permit(:title, :details)
    end
end
