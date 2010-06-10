class GroupsController < ApplicationController
 
 def show
   @group = Group.find(params[:id])
 end
 
 def index
    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @groups }
    end
  end

end
