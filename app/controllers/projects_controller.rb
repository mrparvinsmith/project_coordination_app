class ProjectsController < ApplicationController
  def index
  end

  def show
    @project = Project.find_by(id: params[:id])
  end

  def create_project
    project = Project.new({
      name: params[:name],
      deadline: params[:deadline]
      })
    if project.save
      leader = ProjectMember.new({
        user_id: session[:user_id],
        project_id: project.id
        })
      render :index
    end
  end

  def create_task
  end

  def create_post
  end

  def invite
    project = Project.find_by(id: params[:id])
    new_member = User.find_by(email: params[:email])
    if new_member && !project.members.include?(new_member)
      member = ProjectMember.new({
        user_id: new_member.id,
        project_id: project.id
        })
      if member.save
        redirect_to project_path(project)
      else
        redirect_to project_path(project)
      end
    elsif project.members.include?(new_member)
      redirect_to project_path(project)
    else
      redirect_to project_path(project)
    end
  end
end
