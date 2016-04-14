class ProjectsController < ApplicationController
  # shows a list of current user's projects
  def index
  end

  # show page for individual project
  def show
  end

  # makes a new project
  def create_project
    project = Project.new({
      name: params[:name],
      deadline: params[:deadline]
      })
    if project.save
      # makes current user a member of the project
      leader = ProjectMember.new({
        user_id: session[:user_id],
        project_id: project.id
        })
      if leader.save
        # puts user in the project's show page
        redirect_to project_path(project)
      else
        flash[:notice] = 'no member saved'
        redirect_to '/projects'
      end
    else
      flash[:notice] = 'A project must have a name.'
      redirect_to '/projects'
    end
  end

  # marks project as done
  def complete_project
    project = Project.find_by(id: params[:id])
    project.completed = true
    if project.save
      redirect_to '/projects'
    else
      flash[:notice] = "didn't save"
      redirect_to '/projects'
    end
  end

  # removes current user from a selected project
  def remove_project
    membership = ProjectMember.find_by(project_id: params[:id], user_id: session[:user_id])
    project = Project.find_by(id: params[:id])
    if membership.destroy
      # Deletes project if there are no members
      if project.members.length == 0
        # recursively deletes every task and post within the project
        project.tasks.each do |t|
          t.posts.each do |p|
            p.destroy
          end
          t.destroy
        end
        project.destroy
      end
      redirect_to '/projects'
    end
  end

  # creates a task
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
      flash[:notice] = "Invalid deadline"
      redirect_to project_path(project)
    end
  end

  # marks a task as completed
  def complete_task
    task = Task.find_by(id: params[:id])
    project = Project.find_by(id: task.project_id)
    task.completed = true
    if task.save
      redirect_to project_path(project)
    else
      flash[:notice] = "didn't save"
      redirect_to project_path(project)
    end
  end

  # deletes a task
  def remove_task
    task = Task.find_by(id: params[:id])
    project = Project.find_by(id: task.project_id)
    # deletes associated posts from database
    task.posts.each do |message|
      message.destroy
    end
    if task.destroy
      redirect_to project_path(project)
    end
  end

  # creates a post
  def create_post
    task = Task.find_by(id: params[:id])
    post = Post.new({
      content: params[:content],
      user_id: session[:user_id],
      task_id: task.id,
      })
    if post.save
      redirect_to project_path(task.project)
    else
      flash[:notice] = 'A post must have content.'
      redirect_to project_path(task.project)
    end
  end

  # lets project members add other members by email address
  def invite
    project = Project.find_by(id: params[:id])
    new_member = User.find_by(email: params[:email])
    # checks if new member is a registered user and ensures they are not already a member
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
    # does this if new member is already a member
    elsif project.members.include?(new_member)
      flash[:notice] = "That person is already a member."
      redirect_to project_path(project)
    # does this if new member is not a registered user or email is just entered wrong
    else
      flash[:notice] = params[:email] + " not found in user database."
      redirect_to project_path(project)
    end
  end
end
