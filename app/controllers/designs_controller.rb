class DesignsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_design, only: [:show, :edit, :update, :destroy]

  def index
    @designs = Design.all
  end

  def dashboard
    @designs = Design.where(user: current_user)
  end

  def new
    @design = Design.new
  end

  def create
    @design = Design.new(design_params)
    @design.user = current_user
    if @design.save
      redirect_to dashboard_designs_path
    else
      render :new
    end
  end

  def destroy
    @design.destroy
    redirect_to dashboard_designs_path
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
    designParams = params.require(:design).permit(:title, :description, :image)
  end

  def set_design
    @design = Design.find(params[:id])
  end
end
