class VisitsController < ApplicationController

  def create
	  @link = Link.find_by(:slug => params[:slug])
	  if @link
	  	@link.visits.create(:ip_address => request.remote_ip)
	  	# ^^^ shortcut for >>> Visit.create(:link_id => @link.id)
	    redirect_to "http://#{@link.target_url}"
	  else
	  	raise ActionController::RoutingError.new('Not Found')
	  end



  end


end
