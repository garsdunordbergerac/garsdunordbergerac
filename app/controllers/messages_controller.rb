class MessagesController < ApplicationController
  respond_to :json

  def create
    message = Message.new(params[:message])
    if message.valid?
      MessageMailer.contact(message).deliver
      MessageMailer.contact_admin(message).deliver
      render json: { }
    else
      render json: { errors: message.errors }
    end
  end
end
