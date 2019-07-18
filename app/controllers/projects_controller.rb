class ProjectsController < ApplicationController
  before_action :authenticate_user!
  def index
    @projects = Project.all
  end

  def show
    @projects = Project.find(params[:id])
  end

  def new
    @projects = Project.new({:name => 'Default'})
  end

  def create   
    @projects = Project.new(project_params)
    users = User.where(id: params[:project][:u_id])
    @projects.users << users
    if @projects.save
      flash[:notice] = "Project created successfully."
      redirect_to(projects_path)
    else 
      render('new')
    end 
  end

  def edit
    @projects = Project.find(params[:id])
  end

  def update
    @projects = Project.find(params[:id])
    user_updates
    if @projects.update_attributes(project_params)
      flash[:notice] = "Project updated successfully."
      redirect_to(projects_path(@projects))
    else
      render('edit')
    end
  end

  def delete
    @projects = Project.find(params[:id])
  end

  def destroy
    @projects = Project.find(params[:id])
    @projects.destroy
    flash[:notice] = "Project '#{@projects.name}' destroyed successfully."
    redirect_to(projects_path)
  end 

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def user_updates
    users = User.where(id: params[:project][:u_id])
    old_users = @projects.users
    old_users << users
    @projects.users = old_users.uniq
  end
  
end
