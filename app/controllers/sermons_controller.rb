class SermonsController < ApplicationController

	def index
		@sermons = Sermon.all
	end

	def new
		@sermon = Sermon.new
	end

	def show
		@sermon = Sermon.find(params[:id])
	end

	def create
		@sermon = Sermon.new(sermon_params)
		if @sermon.save
			@sermons = Sermon.all
			flash[:success] = "Sermon Added"
			redirect_to action: "index"
		else
			render 'new'
		end
	end

	def update
	end

	def delete
	end

	private

	def sermon_params
		params.require(:sermon).permit(:title, :church, :preacher, :link)
	end


end
