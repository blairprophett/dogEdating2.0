class ConversationsController < ApplicationController

  def new_msg
    @user = User.find(params[:conversation][:recipient])
  end

  def send_msg
    user1 = current_user
    user2 = User.find(params[:conversation][:recipient])
    dog = Dog.find(params[:conversation][:dog])

    body = params[:conversation][:body]
    subject = params[:conversation][:subject]
    
    @message = user1.send_message(user2, body, subject)
      flash[:notice] = "Your message has been sent!"
      redirect_to '/messages/inbox'
  end

  def show
    @user = current_user
    @conversations = @user.mailbox.conversations
  end

  def inbox
    @user = current_user
    @conversations = @user.mailbox.conversations
    @inbox = @user.mailbox.inbox
    @sentbox = @user.mailbox.sentbox
  end
  
end