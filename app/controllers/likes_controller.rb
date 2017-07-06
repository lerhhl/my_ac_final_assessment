class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @note = Note.find(params[:note_id])
    @user = current_user
    @like = current_user.likes.build(note_id: params[:note_id])
    @like.save
    redirect_to note_path(@note)
  end

  def destroy
    @like = Like.find(params[:id])
    @note = Note.find(params[:note_id])
    @like.destroy
    redirect_to note_path(@note)
  end
end
