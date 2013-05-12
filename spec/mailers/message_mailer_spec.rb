# encoding: utf-8

require 'spec_helper'

describe MessageMailer do
  let(:message_mailer) { MessageMailer.send(:new) }
  let(:contact) do
    contact = mock
    contact.stub(:email).and_return('to@test.com')

    contact
  end
  let(:message) do
    message = mock
    message.stub(:from).and_return('from@test.com')
    message.stub(:to_user).and_return(contact)
    message.stub(:subject).and_return('awesome subject')

    message
  end

  it 'has a default from mail' do
    MessageMailer.default[:from].should == 'no-reply@garsdunordbergerac.org'
  end

  describe '#contact' do
    it 'calls #mail with the email stored in the field "from" of the message parameter' do
      message_mailer.should_receive(:mail){ |options| options[:to].should == 'from@test.com' }
      message_mailer.contact(message)
    end

    it 'calls #mail with the subject "Nous avons bien reçu votre message"' do
      message_mailer.should_receive(:mail){ |options| options[:subject].should == 'Nous avons bien reçu votre message' }
      message_mailer.contact(message)
    end
  end

  describe '#contact_admin' do
    it 'calls #mail with the email stored in the field "to" of the message parameter' do
      message_mailer.should_receive(:mail){ |options| options[:to].should == 'to@test.com' }
      message_mailer.contact_admin(message)
    end

    it 'calls #mail with the subject of the messages prefixed by "[Gars Du Nord Bergerac]"' do
      message_mailer.should_receive(:mail){ |options| options[:subject].should == '[Gars Du Nord Bergerac] -- awesome subject' }
      message_mailer.contact_admin(message)
    end
  end
end
