class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @note = Note.find(params[:note_id])
    @user = current_user
    @like = current_user.likes.build(note_id: params[:note_id])
    @like.save
    LikeMailer.liking_mail(@user, @note).deliver_now
    redirect_to note_path(@note)
  end

  def destroy
    @like = Like.find(params[:id])
    @note = Note.find(params[:note_id])
    @user = current_user
    @like.destroy
    LikeMailer.unliking_mail(@user, @note).deliver_now    
    redirect_to note_path(@note)
  end
end
