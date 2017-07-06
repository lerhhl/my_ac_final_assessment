class NotesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    if current_user != nil
      if current_user.likes.empty?
        @notes = nil
      else
        @likes = current_user.likes
        @notes = @likes.map do |like|
          Note.find(like.note_id)
        end
      end
      if current_user.following.empty?
        @users = nil
      else  
        @followings = current_user.following
        @users = @followings.map do |following|
          User.find(following.id)
        end
      end
    else
      @notes = Note.all
      @users = User.all
    end
  end

  def show
    @note = Note.find(params[:id])
    @like = Like.find_by(note_id: @note.id, user_id: current_user.id)
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      redirect_to root_path
    else
      render :new
    end

  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to root_path
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to root_path    
  end

  private

  def note_params
    params.require(:note).permit(:body, :user_id)
  end
  
end
