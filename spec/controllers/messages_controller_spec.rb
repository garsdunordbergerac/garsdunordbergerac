require 'spec_helper'

describe MessagesController do
  let(:message) do
    message = mock
    message
  end

  let(:message_controller) do
    message_controller = MessagesController.new
    message_controller.stub(:params).and_return(message: 'some data')
    message_controller.stub(:render)
    message_controller
  end

  it 'responds to json' do
    MessagesController.respond_to.keys.should == [:json]
  end

  describe '#create' do
    before(:each) do
      Message.stub(:new).and_return(message)
      MessageMailer.stub_chain(:contact, :deliver)
      MessageMailer.stub_chain(:contact_admin, :deliver)
    end

    context 'when the message is not valid' do
      it 'renders a json with message errors' do
        message.stub(:valid?).and_return(false)
        message.stub(:errors).and_return('error messages')
        message_controller.should_receive(:render).with(json: { errors: 'error messages' })

        message_controller.create
      end
    end

    context 'when the message is valid' do
      before(:each) { message.stub(:valid?).and_return(true) }

      it 'delivers a mail to the contact' do
        MessageMailer.should_receive(:contact).with(message)
        message_controller.create
      end

      it 'delivers a mail to the admin' do
        MessageMailer.should_receive(:contact_admin).with(message)
        message_controller.create
      end

      it 'renders an empty json' do
        message_controller.should_receive(:render).with(json: {})
        message_controller.create
      end
    end
  end
end
