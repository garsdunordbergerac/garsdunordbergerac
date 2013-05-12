require 'spec_helper'

describe Summary do
  it { should allow_mass_assignment_of(:document_url) }
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:title) }

  it { should validate_presence_of(:happened_at) }
  it { should validate_presence_of(:title) }

  describe '.for_year' do
    context 'when there is no summary for the year' do
      it 'returns an empty array' do
        FactoryGirl.create(:summary, happened_at: Date.new(1992, 1 ,4))
        FactoryGirl.create(:summary, happened_at: Date.new(1998, 3 ,8))

        Summary.for_year(1995).should == []
      end
    end

    context 'when the is summaries for year' do
      it 'returns summaries' do
        expected_summaries = []
        expected_summaries << FactoryGirl.create(:summary, happened_at: Date.new(1992, 9 ,11))
        expected_summaries << FactoryGirl.create(:summary, happened_at: Date.new(1992, 1 ,4))
        FactoryGirl.create(:summary, happened_at: Date.new(1998, 3 ,8))

        Summary.for_year(1992).should == expected_summaries
      end
    end
  end

  describe '.years' do
    it 'returns all unique years sorted' do
      FactoryGirl.create(:summary, happened_at: Date.new(1992))
      FactoryGirl.create(:summary, happened_at: Date.new(1980))
      FactoryGirl.create(:summary, happened_at: Date.new(1998))
      FactoryGirl.create(:summary, happened_at: Date.new(1998))

      Summary.years.should == ['1980', '1992', '1998']
    end
  end
end
