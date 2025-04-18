class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy mark_as_completed]
  before_action :require_login
  
  # GET /tasks or /tasks.json
  def index
    @tasks = current_user.tasks
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    if @task.user_id != session[:user_id]
      render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false
    end
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = current_user.tasks.build(task_params)
  
    # Set due date to today if not provided
    @task.due_date ||= Date.today
  
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: "Task was successfully created." }  # Redirect to tasks list
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    # Set due date to today if not provided
    @task.due_date ||= Date.today
  
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_path, notice: "Task was successfully updated." }  # Redirect to tasks list
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    if @task.destroy
      respond_to do |format|
        format.html { redirect_to tasks_path, status: :see_other, notice: "Task was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to tasks_path, alert: "Failed to destroy task." }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # POST /tasks/1/mark_as_completed
  def mark_as_completed
    @task.update(completed: true)
    redirect_to tasks_path, notice: "Task marked as completed!"
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "There is no such page!"
    redirect_to tasks_path
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:title, :description, :due_date, :completed, :priority, :user_id)
  end

  def require_login
    unless current_user && User.exists?(current_user.id)
      reset_session
      redirect_to welcome_path
    end
  end
end
