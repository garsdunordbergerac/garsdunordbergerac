describe Content do
  it { should validate_presence_of(:code) }

  describe '.for_code' do
    before(:each) do
      content_mock = mock('content')
      content_mock.stub(:content).and_return('my content')
      Content.stub(:where).and_return([])
      Content.stub(:where).with(code: :awesome_code).and_return([content_mock])
    end

    context 'when content exists' do
      it 'returns a string with the content' do
        Content.for_code(:awesome_code).should == 'my content'
      end
    end

    context 'when content does not exist' do
      it 'returns nil' do
        Content.for_code(:bad_code).should == nil
      end
    end
  end
end
