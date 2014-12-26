class GroupsController < ApplicationController
	before_action :login_required, :only => [:new, :create, :edit,:update,:destroy]
    def index
        @groups = Group.all
    end
    def show
		@group=Group.find(params[:id])
		@posts=@group.posts
	end
	def new
		@group=Group.new

	end
	def create	
		<% comment do %>
		@group=Group.new(group_params)
		@group.save
		redirect_to groups_path
		<% end %>
		@group=current_user.groups.build(group_params)
		if @group.save
			redirect_to groups_path
		else
			render :new
		end
	end
	def edit
		<% comment do %>
		@group=Group.find(params[:id])
		#@post=@group.posts.find(params[:id])
		<%end%>
		@group = current_user.groups.find(params[:id])
	end
	def update 
		<% comment do %>
		@group=Group.find(params[:id])
		if @group.update(group_params)
			redirect_to group_path(@group)
			#redirect_to groups_path
		else
			render :edit
		end
		<%end%>
		@group = current_user.groups.find(params[:id])
		if @group.update(group_params)
			redirect_to group_path(@group)
		else
			render :edit
		end
	end
	def destroy
		<% comment do %>
		@group=Group.find(params[:id])
		@group.destroy
		redirect_to groups_path
		<%end%>
		@group=current_user.groups.find(params[:id])
		@group.destroy
		redirect_to groups_path
	end





	private

	def group_params
		params.require(:group).permit(:title, :description)
	end
end
