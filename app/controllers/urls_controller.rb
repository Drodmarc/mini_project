class UrlsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_url, only: :show
  before_action :set_own_url, only: [:destroy, :update, :edit]

  def index
    @url = Url.all.includes(:user)
    @domain = request.base_url
  end

  def redirect
    @short_ext = params[:short_url]
    @url=Url.find_by(short_url: @short_ext)
    redirect_to @url.long_url
  end

  def new
    @url= Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.user = current_user
    if @url.save
      redirect_to urls_path
    else
      render :new
    end
  end
  def edit;

  end

  def update
    if @url.update(url_params)
      redirect_to urls_path
    else
      render :edit
    end
  end

  def show; end

  def destroy
    if @url.destroy
      redirect_to urls_path
    end
  end


  def set_own_url
    @url = current_user.urls.find_by_id(params[:id])
    if @url.nil?
      flash[:alert] = 'this url not belongs_to you or not exists'
      redirect_to urls_path
    end
  end

  private

  def url_params
    params.require(:url).permit(:description, :long_url, :short_url)
  end

  def set_url
    @url = Url.find(params[:id])
  end
end
