class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  def update

    if @service.update(service_params)
      redirect_to service_path(@service)
    else
      flash[:error] = 'Didn\'t save'
    end
  end

  def edit
  end

  def show
  end

  private

  def service_params
    serviceParams = params.require(:service).permit(:title, :description, :url, :remove_image, images:[])
  end

  def set_service
    @service = Service.find(params[:id])
  end
end
