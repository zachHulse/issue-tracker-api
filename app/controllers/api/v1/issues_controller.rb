class Api::V1::IssuesController < ApplicationController
  before_action :find_issue, only: [:show, :update, :destroy]
  before_action :find_project, only: [:index, :create, :update]

  def index
    authorize Issue
    @issues = @project.issues.all
    render json: @issues
  end

  def show
    render json: @issue
  end

  def create
    authorize Issue
    @issue = Issue.new(issue_params)
    @issue.project_id = @project.id
    @issue.code = "#{@project.abbreviation}-#{@project.issues.size}"
    if @issue.save
      render json: @issue
    else
      render error: { error: 'Unable to create issue.' }, status: 400
    end
  end

  def update
    if @issue
      @issue.update(issue_params)
      render json: @issue
    else
      render json: { error: 'Unable to update issue.' }, status: 400
    end
  end

  def destroy
    if @issue
      @issue.destroy
      render json: { message: 'Issue successfully deleted.' }, status: 200
    else
      render json: { error: 'Unable to delete issue.' }, status: 400
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:name, :project_id, :sprint_id, :description, :story_points)
  end

  def find_issue
    @issue = authorize Issue.find(params[:id])
  end

  def find_project
    @project = Project.find(params[:project_id])
  end
end
