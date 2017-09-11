class ListsController < ApplicationController

	def index 
	@list = List.all
	@task = Task.all 
	end 

	def show
	@list = List.find(params[:id])
	@task = Task.new

	end 

	def new
	@list = List.new 
	end

	def create
	list_params = params[:list].permit(:list_name)
	list = List.create(list_params)
	redirect_to lists_path(id: list.id)
	end

	def edit
	@list = List.find(params[:id])
	end

	def update
	list_params = params[:list].permit(:list_name)
	list = List.find(params[:id])
	list.update(list_params)
	redirect_to lists_path(id: list.id)
	end

	def destroy
	@list = List.find(params[:id])
	@list.destroy
	redirect_to lists_path
	end
end