class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      flash[:error] = 'Didn\'t save'
    end
  end

  def edit
  end

  def show
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
