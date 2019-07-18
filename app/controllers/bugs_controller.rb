class BugsController < ApplicationController
  before_action :authenticate_user! , :project_id
  
  def index
    # @bug = Bug.all
    @bugs=Bug.where(:project_id => @project_id)
  end

  def show
    # binding.pry
    @bug=Bug.find(params[:id])
  end

  def new
    # binding.pry
    @project = Project.find(@project_id)
    @bug = @project.bugs.new
  end

  def create
    @project = Project.find(@project_id)
    @bug= @project.bugs.new(bug_params)
    if @bug.save
      redirect_to(project_bugs_path)
    else
      render('new')
    end
  end

  def edit
    @project = Project.find(@project_id)
    @bug=Bug.find(params[:id])
  end

  def update
    @project = Project.find(@project_id)
    @bug= @project.bugs.find(params[:id])
    if @bug.update_attributes(bug_params)
      flash[:notice] = "Bug updated successfully."
      redirect_to(project_bugs_path)
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
  end

  private

  def project_id
    @project_id = params[:project_id]
  end

  def bug_params
    params.require(:bug).permit(:bug_name, :bug_description, :status)
  end
end
