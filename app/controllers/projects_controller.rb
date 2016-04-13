class ProjectsController < ApplicationController
  def index
  end

  def show
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
      if leader.save
        redirect_to project_path(project)
      else
        render 'not a member'
      end
    else
      render 'no project'
    end
  end

  def create_task
    project = Project.find_by(id: params[:id])
    new_task = Task.new({
      content: params[:content],
      deadline: params[:deadline],
      project_id: project.id
      })
    if new_task.save
      redirect_to project_path(project)
    else
      render 'no task'
    end
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
        flash[:notice] = "An error occurred. Please try again later."
        redirect_to project_path(project)
      end
    elsif project.members.include?(new_member)
      flash[:notice] = "That person is already a member."
      redirect_to project_path(project)
    else
      flash[:notice] = params[:email] + " not found in user database."
      redirect_to project_path(project)
    end
  end
end
