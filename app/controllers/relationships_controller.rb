class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @user = User.find(params[:followed_id])
    current_user.following.push(@user)
    redirect_to users_index_path
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.following.delete(@user)
    redirect_to users_index_path
  end

end
