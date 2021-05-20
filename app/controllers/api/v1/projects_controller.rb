class Api::V1::ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :update, :destroy]

  def index
    authorize Project
    @projects = Project.all
    render json: @projects
  end

  def show
    render json: @project
  end

  def create
    authorize Project
    @project = Project.new(project_params)
    if @project.save
      render json: @project
    else
      render error: { error: 'Unable to create project.' }, status: 400
    end
  end

  def update
    if @project
      @project.update(project_params)
      render json: @project
    else
      render json: { error: 'Unable to update issue.' }, status: 400
    end
  end

  def destroy
    if @project
      @project.destroy
      render json: { message: 'Project successfully deleted.' }, status: 200
    else
      render json: { error: 'Unable to delete project.' }, status: 400
    end
  end

  private

  def project_params
    params.require(:name, :abbreviation).permit(:name, :abbreviation, :description)
  end

  def find_project
    @project = authorize Project.find(params[:id])
  end
end
