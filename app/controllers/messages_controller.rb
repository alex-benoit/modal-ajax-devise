class MessagesController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        # format.html in the very rare case the user has JS disabled in browser
        format.html { redirect_to root_path, notive: 'Success!' }
        format.js { flash[:notice] = 'Success!' } # this will render `app/views/messages/create.js.erb`
      end
    else
      respond_to do |format|
        # format.html in the very rare case the user has JS disabled in browser
        format.html { redirect_to root_path, alert: 'Failed!' }
        format.js # this will render `app/views/messages/create.js.erb`
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:email, :body)
  end
end
