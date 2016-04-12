class ProjectsController < ApplicationController
  def index
  end

  def show
    @project = Project.find_by(id: params[:id])
  end
end
