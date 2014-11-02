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

	def show
	  @link = Link.find_by(:id => params[:id])

	end

	def edit
	  @link = Link.find_by(:id => params[:id])

	end

	def update
	  @link = Link.find_by(:id => params[:id])

	  if @link.update(params[:link])
	  	@link.strip_http!
	    flash[:success] = "Link updated."
	  	redirect_to link_path(@link.id)  
	  	########    ^^^ "/links/#{@link.id}"
	  else
	  	render 'edit'
	  end
	end

end
