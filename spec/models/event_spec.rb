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
      it 'returns the events' do
        expected_events = []
        expected_events << FactoryGirl.create(:event, begin_at: Date.new(1981, 4, 11))
        expected_events << FactoryGirl.create(:event, begin_at: Date.new(1981, 6, 3))

        FactoryGirl.create(:event, begin_at: Date.new(1980, 8, 1))
        FactoryGirl.create(:event, begin_at: Date.new(1982, 2, 9))

        Event.for_year(1981).should == expected_events
      end
    end
  end
end
