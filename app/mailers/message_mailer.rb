# encoding: utf-8

class MessageMailer < ActionMailer::Base
  default from: 'no-reply@garsdunordbergerac.org'

  def contact(message)
    @message = message
    mail({
      to:      message.from,
      subject: 'Nous avons bien reçu votre message'
    })
  end

  def contact_admin(message)
    @message = message
    mail({
      to:      message.to_user.email,
      subject: "[Gars Du Nord Bergerac] -- #{message.subject}"
    })
  end

end
