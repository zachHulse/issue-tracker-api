class Api::V1::SprintsController < ApplicationController
  before_action :find_sprint, only: [:show, :update, :destroy]
  before_action :find_project, only: [:index, :create, :update]

  def index
    authorize Sprint
    @sprints = @project.sprints.all
    render json: @sprints
  end

  def show
    render json: @sprint
  end

  def create
    authorize Sprint
    @sprint = Sprint.new(sprint_params)
    @sprint.project_id = @project.id
    if @sprint.save
      render json: @sprint
    else
      render error: { error: 'Unable to create sprint.' }, status: 400
    end
  end

  def update
    if @sprint
      @sprint.update(sprint_params)
      render json: @sprint
    else
      render json: { error: 'Unable to update sprint.' }, status: 400
    end
  end

  def destroy
    if @sprint
      @sprint.destroy
      render json: { message: 'Sprint successfully deleted.' }, status: 200
    else
      render json: { error: 'Unable to delete sprint.' }, status: 400
    end
  end

  private

  def sprint_params
    params.require(:sprint).permit(:start, :finish, :project_id)
  end

  def find_sprint
    @sprint = authorize Sprint.find(params[:id])
  end

  def find_project
    @project = Project.find(params[:project_id])
  end
end
