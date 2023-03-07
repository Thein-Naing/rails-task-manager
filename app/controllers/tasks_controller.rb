class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  def index
    @tasks = Task.all
  end

  def show
    @task
  end

  def new
    @task = Task.new
  end

  def create
    Task.create!(params_task)
    redirect_to task_path(task)
  end

  def edit
    @task
  end

  def update
    @task.update!(params_task)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def params_task
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
