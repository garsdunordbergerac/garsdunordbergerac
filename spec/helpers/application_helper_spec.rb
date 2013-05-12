require 'spec_helper'

describe ApplicationHelper do
  describe '#current_event_year' do
    before(:each) { Date.stub(:today).and_return(Date.new(1983, 8, 3)) }

    context 'when current yeat is not present in the years' do
      it 'returns the first year in the array' do
        helper.current_event_year(['1980', '1985', '1992']).should == '1980'
      end
    end

    context 'when current year is present in the years' do
      it 'returns current year' do
        helper.current_event_year(['1980', '1983', '1992']).should == '1983'
      end
    end
  end
end
