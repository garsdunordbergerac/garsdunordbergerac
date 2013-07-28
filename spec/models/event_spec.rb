require 'spec_helper'

describe Event do
  it { should allow_mass_assignment_of(:album_title) }
  it { should allow_mass_assignment_of(:begin_at) }
  it { should allow_mass_assignment_of(:description) }
  it { should allow_mass_assignment_of(:end_at) }
  it { should allow_mass_assignment_of(:place) }
  it { should allow_mass_assignment_of(:title) }

  it { should validate_presence_of(:begin_at) }
  it { should validate_presence_of(:place) }
  it { should validate_presence_of(:title) }

  describe '.for_year' do
    context 'when there is no events for this year' do
      it 'returns an empty array' do
        Event.for_year(1988).should == []
      end
    end

    context 'when there is events for this year' do
      it 'returns the events sorted in reverse chronological order' do
        expected_events = []
        expected_events << FactoryGirl.create(:event, begin_at: Date.new(1981, 6, 3))
        expected_events << FactoryGirl.create(:event, begin_at: Date.new(1981, 4, 11))

        FactoryGirl.create(:event, begin_at: Date.new(1980, 8, 1))
        FactoryGirl.create(:event, begin_at: Date.new(1982, 2, 9))

        Event.for_year(1981).should == expected_events
      end
    end
  end

  describe '.next' do
    before(:each) { Date.stub(:today).and_return(Date.new(1985, 10, 5)) }

    context 'when there is no future events' do
      it 'returns nil' do
        FactoryGirl.create(:event, begin_at: Date.new(1985, 5, 9))

        Event.next.should == nil
      end
    end

    context 'when a future event exists' do
      it 'returns the earliest event' do
        expected_event = FactoryGirl.create(:event, begin_at: Date.new(1985, 10, 8))
        FactoryGirl.create(:event, begin_at: Date.new(1985, 10, 9))

        Event.next.should == expected_event
      end
    end
  end

  describe '.years' do
    it 'returns all unique years sorted' do
      FactoryGirl.create(:event, begin_at: Date.new(1992))
      FactoryGirl.create(:event, begin_at: Date.new(1980))
      FactoryGirl.create(:event, begin_at: Date.new(1998))
      FactoryGirl.create(:event, begin_at: Date.new(1998))

      Event.years.should == ['1980', '1992', '1998']
    end
  end
end
