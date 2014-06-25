class ConversationsController < ApplicationController

  def new_msg
    @user = User.find(params[:conversation][:recipient])
  end

  def send_msg

    user1 = current_user
    user2 = User.find(params[:conversation][:recipient])

    body = params[:conversation][:body]
    subject = params[:conversation][:subject]
    
    @message = user1.send_message(user2, body, subject)
      flash[:notice] = "Your message has been sent!"
      redirect_to '/'
  end



end