class TasksController < ApplicationController

	def index 
	@task = Task.all
	end 

	def show
	@task = Task.find(params[:id])
	end 

	def new
	@task = Task.new 
	end

	def create
	list = List.find(params[:list_id])
	task_params = params.require(:task).permit(:name, :priority)
	list.tasks.create(task_params)
	redirect_to list_path(id: list.id)
	end

	def edit
	@task = Task.find(params[:id])
	end

	def update
	task_params = params[:task].permit(:name, :priority, :status, :due_date)
	task = Task.find(params[:id])
	task.update(task_params)
	redirect_to list_path(id: task.list.id)
	end

	def destroy
	@task = Task.find(params[:id])
	@task.destroy
	redirect_to list_path(id: @task.list.id)
	end

end