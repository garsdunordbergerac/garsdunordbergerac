require 'spec_helper'

describe Message do
  let(:message) { FactoryGirl.build(:message) }

  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:subject) }

  it 'validates with #receiver_exist?' do
    message.should_receive(:receiver_exist?)
    message.valid?
  end

  describe '#persisted?' do
    it 'returns false' do
      message.persisted?.should == false
    end
  end

  describe '#to_user' do
    context 'when the Contact does not exist' do
      it 'returns nil' do
        Contact.stub(:find_by_id).and_return(nil)
        message.to_user.should == nil
      end
    end

    context 'when the contact exists' do
      it 'returns a Contact by its id stored in the "to" field' do
        expected_contact = mock
        Contact.stub(:find_by_id).with(42).and_return(expected_contact)

        message.to = 42
        message.to_user.should == expected_contact
      end
    end
  end

  describe '#receiver_exist?' do
    context 'when the contact does not exist' do
      it 'returns false' do
        Contact.stub(:exists?).and_return(false)
        message.send(:receiver_exist?).should == false
      end
    end

    context 'when the contact exists' do
      it 'returns true' do
        Contact.stub(:exists?).and_return(true)
        message.send(:receiver_exist?).should == true
      end
    end
  end
end
