class PodcastsController < ApplicationController

	def index
		@podcasts = Podcast.all
	end

	def new
		@podcast = Podcast.new
	end

	def show
		@podcast = Podcast.find(params[:id])
	end

	def create
		@podcast = Podcast.new(podcast_params)
		if @podcast.save
		        flash[:success] = "Podcast Added"
		        redirect_to action: "index"
		else
		        render 'new'
		end

	end

	private

	def podcast_params
		params.require(:podcast).permit(:title, :church, :preacher, :link)
	end


end
