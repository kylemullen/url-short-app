class LinksController < ApplicationController

	def index

	end

	def new
	  @link = Link.new
	end

	def create
	  @link = current_user.links.new(params[:link])

	  if @link.save
	  	flash[:success] = "Link Created."
	  	redirect_to links_path
	  else
	  	render 'new'

	  end
	end

end
