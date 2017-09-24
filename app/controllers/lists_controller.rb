class ListsController < ApplicationController

	def new
		@list = List.new
	end
	
	def show 
	  	@list = List.find(params[:id]) 
	end

	def index
  		@lists = List.all
  	end

	def create
		@list = List.new(list_params)
		if @list.save
			flash[:success] = "The list was created!"
		  	redirect_to @list
		else
		  render :new
		end
	end

	private 

	def list_params
		params.require(:list).permit(:title)
	end
end