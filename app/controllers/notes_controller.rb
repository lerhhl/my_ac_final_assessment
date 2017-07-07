class NotesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    if current_user != nil
      if current_user.following.empty?
        @users = nil
        @notes = nil
      else  
        @followings = current_user.following
        @users = @followings.map do |following|
          User.find(following.id)
        end
        @notes = @users.map do |user|
          user.notes
        end
        @notes.flatten!
      end
    else
      @notes = Note.all
      @users = User.all
    end
  end

  def show_all
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
    @like = Like.find_by(note_id: @note.id, user_id: current_user.id)
  end

  def new
    @note = Note.new
  end

  def create
    # byebug
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
