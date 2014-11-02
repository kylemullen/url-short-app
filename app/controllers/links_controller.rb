class LinksController < ApplicationController

	def index
		@links = current_user.links

	end

	def new
	  @link = Link.new
	end

	def create
	  @link = current_user.links.new(params[:link])
	  @link.strip_http!

	  if @link.save
	  	flash[:success] = "Link Created."
	  	redirect_to links_path
	  else
	  	render 'new'

	  end
	end

	def redirect
	  @link = Link.find_by(:slug => params[:slug])
	  if @link
	    redirect_to "http://#{@link.target_url}"
	  else
	  	raise ActionController::RoutingError.new('Not Found')
	  end
	end

end
