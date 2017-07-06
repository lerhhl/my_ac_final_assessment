class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @user = User.find(params[:followed_id])
    @note = Note.find(params[:note_id])
    current_user.following.push(@user)
    redirect_to note_path(@note)
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    @note = Note.find(params[:note_id])
    current_user.following.delete(@user)
    redirect_to note_path(@note)
  end

end
