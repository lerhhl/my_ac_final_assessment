class LikeMailer < ApplicationMailer

  def liking_mail(user, note)
    @like_user = user
    @note = note
    mail to: @note.user.email, subject: "#{@like_user.email} has liked your #{@note.id}"
  end
  
  def unliking_mail(user, note)
    @unlike_user = user
    @note = note
    mail to: @note.user.email, subject: "#{@unlike_user.email} has unliked your #{@note.id}"  
  end
  
end
