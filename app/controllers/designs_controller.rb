class DesignsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_design, only: [:show, :edit, :update, :destroy]

  def index
    @designs = Design.all
  end

  def new
    @design = Design.new
  end

  def create
    @design = Design.new(design_params)
    if @design.save
      redirect_to design_path(@design)
    else
      render :new
    end
  end

  def update

    if @design.update(design_params)
      redirect_to design_path(@design)
    else
      flash[:error] = 'Didn\'t save'
    end
  end

  def edit
  end

  def show
  end

  private

  def design_params
    designParams = params.require(:project).permit(:title, :description, :image)
  end

  def set_design
    @design = Design.find(params[:id])
  end
end
